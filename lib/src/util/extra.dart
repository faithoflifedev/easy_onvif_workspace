import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

extension UsageExtension on DioException {
  String get usage {
    return response?.data['error']['errors'] == null
        ? message!
        : response!.data['error']['errors'].toString();
  }
}

extension Helpers on String {
  Uri get parseUri {
    return Uri.parse(this);
  }

  void buildXml(
    XmlBuilder builder, {
    required String tag,
    String? namespace,
  }) =>
      builder.element(tag, nest: () {
        if (namespace != null) {
          builder.namespace(namespace);
        }

        builder.text(this);
      });
}
