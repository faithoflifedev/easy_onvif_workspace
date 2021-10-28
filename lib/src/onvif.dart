import 'package:easy_onvif/onvif.dart';
import 'package:xml/xml.dart';

class Onvif {
  final String username;
  final String password;

  late final DeviceManagement deviceManagement;
  late final Duration timeDelta;

  Media? _media;
  Ptz? _ptz;

  Media get media {
    if (_media == null) throw Exception();

    return _media!;
  }

  Ptz get ptz {
    if (_ptz == null) throw Exception();

    return _ptz!;
  }

  Onvif({required host, required this.username, required this.password}) {
    deviceManagement = DeviceManagement(
        onvif: this, uri: 'http://${host}/onvif/device_service');
  }

  ///Connect to the Onvif device and retrieve its capabilities
  Future<void> initialize() async {
    final datetime = await deviceManagement.getSystemDateAndTime();

    final capabilities = await deviceManagement.getCapabilities();

    timeDelta = datetime.utcDateTime != null
        ? datetime.utcDateTime!.difference(DateTime.now().toUtc())
        : const Duration(seconds: 0);

    if (capabilities.media != null) {
      _media = Media(onvif: this, uri: capabilities.media!.xaddr);
    }

    if (capabilities.ptz != null) {
      _ptz = Ptz(onvif: this, uri: capabilities.ptz!.xaddr);
    }
  }

  XmlDocument secureRequest(XmlDocumentFragment content) =>
      SoapRequest.envelope(_securityHeader, content);

  XmlDocumentFragment get _securityHeader {
    final authorization =
        Authorization(password: password, timeDelta: timeDelta);

    final security = SoapRequest.security(
        username: username,
        password: authorization.digest,
        nonce: authorization.nonce,
        created: authorization.timeStamp);

    return SoapRequest.header(security);
  }

  /* for testing:
        , postProcess: (String xmlBody, dynamic jsonMap, Envelope envelope) {
      print(xmlBody);
      print('\n\n');
      print(jsonMap);
    } */
}
