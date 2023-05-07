import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/src/model/media_uri.dart';
import 'package:intl/intl.dart';
import 'package:loggy/loggy.dart';
import 'package:universal_io/io.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

/// Helper functions for Onvif related operations
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

  static LogOptions convertToLogOptions(String logLevel) {
    var logOptions = const LogOptions(LogLevel.off);

    switch (logLevel) {
      case 'all':
        logOptions = const LogOptions(LogLevel.all);
        break;

      case 'debug':
        logOptions = const LogOptions(LogLevel.debug);
        break;

      case 'info':
        logOptions = const LogOptions(LogLevel.info);
        break;

      case 'warning':
        logOptions = const LogOptions(LogLevel.warning);
        break;

      case 'error':
        logOptions = const LogOptions(LogLevel.error);
        break;
    }

    return logOptions;
  }

  static String? get userHome =>
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

  static bool stringToBool(String value) => value.toLowerCase() == 'true';

  static bool stringOrMappedToBool(dynamic value) => value.runtimeType == String
      ? stringToBool(value as String)
      : mappedToBool(value as Map<String, dynamic>);

  static List<int>? nullableMappedToIntList(String? value) =>
      value?.toString().split(',').map((item) => int.parse(item)).toList();

  static List<String> mappedToStringList(Map<String, dynamic> value) =>
      stringToList(mappedToString(value));

  static List<String>? nullableMappedToStringList(List<dynamic>? value) =>
      value?.map((element) => mappedToString(element)).toList();

  static bool? nullableStringToBool(String? value) =>
      value != null ? stringToBool(value) : null;

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

  static MulticastConfiguration? emptyMapToNull(Map<String, dynamic>? json) =>
      json != null && json.keys.isNotEmpty
          ? MulticastConfiguration.fromJson(json)
          : null;

  // The tryParse is used to work-around the non-compliant date returned by the
  // TL-IPC43AN-4 device
  static DateTime mappedToDateTime(Map<String, dynamic> value) {
    final rawDt = value['\$'];

    final formatter = DateFormat(r'E MMM  d HH:mm:ss yyyy');

    return DateTime.tryParse(rawDt) ?? formatter.parse(rawDt);
  }

  static DateTime? nullableMappedToDateTime(Map<String, dynamic>? value) =>
      value != null ? mappedToDateTime(value) : null;

  static DateTime mappedToStdDateTime(Map<String, dynamic> value) {
    final rawDt = value['\$'];

    final formatter = DateFormat('YYYY-MM-dd\'T\'HH:mm:ss\'Z\'');

    return DateTime.tryParse(rawDt) ?? formatter.parse(rawDt);
  }

  static DateTime? nullableMappedStdToDateTime(Map<String, dynamic>? value) =>
      value != null && value.isNotEmpty ? mappedToStdDateTime(value) : null;

  static List<String> stringToList(String value) =>
      value.split(RegExp(r'[ ,]'));

  static List<String>? nullableStringToList(String? value) =>
      value != null ? stringToList(value) : null;

  static String parseHtmlString(String htmlString) =>
      (html.Element.span()..appendHtml(htmlString)).innerText;
}

class NotSupportedException implements Exception {}

enum MediaSupportLevel { none, one, two, both }
