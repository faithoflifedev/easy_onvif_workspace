import 'package:easy_onvif/soap.dart';
import 'package:xml/xml.dart';

class ReferenceToken {
  final String token;

  ReferenceToken(this.token) {
    if (token.isEmpty) {
      throw ArgumentError('token cannot be empty');
    }

    if (token.length > 64) {
      throw ArgumentError('token cannot be longer than 64 characters');
    }
  }

  void buildXml(
    XmlBuilder builder, {
    String tag = 'ProfileToken',
    String namespace = Xmlns.tptz,
  }) =>
      builder.element(tag,
          nest: () => builder
            ..namespace(namespace)
            ..text(token));
}
