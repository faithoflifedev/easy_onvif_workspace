import 'package:easy_onvif/onvif.dart';
import 'package:loggy/loggy.dart';
import 'package:xml/xml.dart';

class Onvif {
  final String username;
  final String password;
  final bool debug;

  late final DeviceManagement deviceManagement;

  final serviceMap = <String, String>{};

  Duration? _timeDelta;
  Media? _media;
  Ptz? _ptz;

  Duration get timeDelta => _timeDelta!;

  Media get media {
    if (_media == null) throw Exception();

    return _media!;
  }

  Ptz get ptz {
    if (_ptz == null) throw Exception();

    return _ptz!;
  }

  static Future<Onvif> connect(
      {required host,
      required username,
      required password,
      debug = false}) async {
    var onvif =
        Onvif(host: host, username: username, password: password, debug: debug);

    await onvif.initialize();

    return onvif;
  }

  Onvif(
      {required host,
      required this.username,
      required this.password,
      this.debug = false}) {
    Loggy.initLoggy();

    deviceManagement =
        DeviceManagement(onvif: this, uri: 'http://$host/onvif/device_service');
  }

  ///Connect to the Onvif device and retrieve its capabilities
  Future<void> initialize() async {
    if (debug) logDebug('initializing...');

    final datetime = await deviceManagement.getSystemDateAndTime();

    _timeDelta = datetime.utcDateTime != null
        ? datetime.utcDateTime!.difference(DateTime.now().toUtc())
        : const Duration(seconds: 0);

    final serviceList = await deviceManagement.getServices();

    serviceMap.addAll(
        {for (var service in serviceList) service.nameSpace: service.xAddr});

    if (serviceMap.containsKey('http://www.onvif.org/ver10/media/wsdl')) {
      _media = Media(
          onvif: this,
          uri: serviceMap['http://www.onvif.org/ver10/media/wsdl']!);
    }

    if (serviceMap.containsKey('http://www.onvif.org/ver20/ptz/wsdl')) {
      _ptz = Ptz(
          onvif: this, uri: serviceMap['http://www.onvif.org/ver20/ptz/wsdl']!);
    }

    if (debug) logDebug('initialization complete');
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
