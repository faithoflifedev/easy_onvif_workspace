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
            queryParameters: parsedUri.queryParameters.isNotEmpty
                ? parsedUri.queryParameters
                : null)
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

  static bool stringToBool(String value) => value.toLowerCase() == 'true';

  static bool? optionalBool(String? value) =>
      value != null ? stringToBool(value) : null;

  static int? optionalInt(String? value) =>
      value != null ? int.parse(value) : null;

  static double? optionalDouble(String? value) =>
      value != null ? double.parse(value) : null;

  static bool mappedToBool(Map<String, dynamic> value) =>
      value.containsKey('\$') ? stringToBool(value['\$']) : false;

  static bool? nullableMappedToBool(Map<String, dynamic>? value) =>
      value != null ? mappedToBool(value) : null;

  static int mappedToInt(Map<String, dynamic> value) => int.parse(value['\$']!);

  static int? nullableMappedToInt(Map<String, dynamic>? value) =>
      value != null ? mappedToInt(value) : null;

  static double mappedToDouble(Map<String, dynamic> value) =>
      double.parse(value['\$']);

  static double? nullableMappedToDouble(Map<String, dynamic>? value) =>
      value != null ? mappedToDouble(value) : null;

  static String mappedToString(Map<String, dynamic> value) => value['\$'];

  static Uri mappedToUri(Map<String, dynamic> value) =>
      Uri.parse(mappedToString(value));

  static String? nullableMappedToString(Map<String, dynamic>? value) =>
      value != null && value.containsKey('\$') ? mappedToString(value) : null;

  static DateTime mappedToDateTime(Map<String, dynamic> value) =>
      DateTime.parse(value['\$']);

  static DateTime? nullableMappedToDateTime(Map<String, dynamic>? value) =>
      value != null ? mappedToDateTime(value) : null;

  static List<T> unbound<T>(Map<String, dynamic> value) {
    return <T>[];
  }
}
