import 'package:easy_onvif/src/soap/authorization.dart';
import 'package:xml/xml.dart';

class UsernameToken {
  Authorization? authorization;

  XmlDocumentFragment toXml(XmlBuilder builder, Authorization authorization) {
    builder.element('UsernameToken', nest: () {
      builder.element('Username', nest: authorization.authInfo.username);
      builder.element('Password',
          attributes: {
            'Type':
                'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordDigest'
          },
          nest: authorization.digest);
      builder.element('Nonce',
          attributes: {
            'EncodingType':
                'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'
          },
          nest: authorization.nonce.toBase64());
      builder.element('Created', nest: () {
        builder.namespace(
            'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd');
        builder.text(authorization.utcTimeStamp);
      });
    });

    return builder.buildFragment();
  }
}
