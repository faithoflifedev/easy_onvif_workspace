import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:easy_onvif/model/media_uri.dart';
import 'package:universal_io/io.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

class OnvifUtil {
  static Map<String, dynamic> xmlToMap(String soapResponse) {
    final transformer = Xml2Json();

    final xmlEnvelope = XmlDocument.parse(soapResponse).getElement('Envelope',
        namespace: 'http://www.w3.org/2003/05/soap-envelope');

    if (xmlEnvelope == null) throw Exception();

    transformer.parse(xmlEnvelope.toXmlString());

    final rootMap =
        json.decode(transformer.toBadgerfish(useLocalNameForNodes: true))
            as Map<String, dynamic>;

    if (!rootMap.containsKey('Envelope')) throw Exception();

    return rootMap['Envelope'];
  }

  static String authenticatingUri(
      String uri, String username, String password) {
    final parsedUri = Uri.parse(uri);

    return Uri(
            scheme: parsedUri.scheme,
            userInfo: '$username:$password',
            host: parsedUri.host,
            port: parsedUri.port,
            pathSegments: parsedUri.pathSegments,
            queryParameters: parsedUri.queryParameters)
        .toString();
  }

  static Future<Uint8List> takeSnapshot(String username, String password,
      {required MediaUri snapshotUri}) async {
    final auth = base64.encode(utf8.encode('$username:$password'));

    final response = await Dio().get(snapshotUri.uri,
        options: Options(
            responseType: ResponseType.stream,
            headers: {'Authorization': 'BASIC $auth'}));

    final bytesBuilder = BytesBuilder();

    await for (final chunk in response.data.stream) {
      bytesBuilder.add(chunk);
    }

    return bytesBuilder.takeBytes();
  }

  static Future<String> takeSnapshotBase64(String username, String password,
      {required MediaUri snapshotUri}) async {
    final bytes = await OnvifUtil.takeSnapshot(username, password,
        snapshotUri: snapshotUri);

    return base64.encode(bytes.toList());
  }

  static Future<void> takeSnapshotFile(String username, String password,
      {required MediaUri snapshotUri, required File fileStore}) async {
    final bytes = await OnvifUtil.takeSnapshot(username, password,
        snapshotUri: snapshotUri);

    await fileStore.writeAsBytes(bytes);
  }

  static String? get userHome =>
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];
}

bool stringToBool(String value) {
  return value.toLowerCase() == 'true';
}

int stringToInt(String value) {
  return int.parse(value);
}

double stringToDouble(String value) {
  return double.parse(value);
}

int? nullableStringToInt(String? value) {
  return value != null ? stringToInt(value) : null;
}

bool? nullableStringToBool(String? value) {
  return value != null ? stringToBool(value) : null;
}

bool mappedStringToBool(Map<String, dynamic> value) {
  return value.containsKey('\$') ? stringToBool(value['\$']) : false;
}

String mappedToString(Map<String, dynamic> value) {
  return value.containsKey('\$') ? value['\$']! : '';
}

String? nullableMappedToString(Map<String, dynamic>? value) {
  return value != null ? mappedToString(value) : null;
}

double mappedToDouble(Map<String, dynamic> value) {
  if (value.containsKey('\$')) {
    return double.parse(value['\$']!);
  } else {
    throw Exception('Problem parsing double');
  }
}
