import 'package:easy_onvif/src/soap/authorization.dart';
import 'package:easy_onvif/src/soap/xmlns.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

import 'username_token.dart';

class Security {
  @JsonKey(name: 'UsernameToken')
  final UsernameToken usernameToken;

  final int mustUnderstand;

  Security({
    required this.usernameToken,
    required this.mustUnderstand,
  });

  XmlDocumentFragment toXml(XmlBuilder builder, Authorization authorization) {
    builder.element(
      'Security',
      namespaces: {Xmlns.s: 's'},
      nest: () {
        builder.namespace(
            'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd');

        builder.attribute(
          'mustUnderstand',
          mustUnderstand,
          namespace: Xmlns.s,
        );

        usernameToken.toXml(builder, authorization);
      },
    );

    return builder.buildFragment();
  }
}
