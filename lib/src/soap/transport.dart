import 'package:dio/dio.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/soap.dart';
import 'package:easy_onvif/src/model/envelope.dart';
import 'package:easy_onvif/util.dart';
import 'package:loggy/loggy.dart';
import 'package:xml/xml.dart';

/// Utility class for interacting through the SOAP protocol
class Transport with UiLoggy {
  final Dio dio;

  final AuthInfo authInfo;

  static Duration timeDelta = Duration.zero;

  static final builder = XmlBuilder();

  Transport({
    required this.dio,
    required this.authInfo,
  });

  /// Send the SOAP [requestData] to the given [url] endpoint.
  Future<Envelope> sendRequest(Uri uri, XmlDocument requestData) async {
    Response? response;

    try {
      response = await dio.post(uri.toString(),
          data: requestData.toString(),
          options: Options(headers: {
            // Headers.contentTypeHeader: 'text/xml; charset=utf-8',
            Headers.contentTypeHeader: 'application/soap+xml; charset=utf-8',
          }));
    } on DioException catch (error) {
      switch (error.response?.statusCode) {
        case 500:
        case 400:
          loggy.error('ERROR RESPONSE:\n${error.response?.data}');

          final jsonMap = OnvifUtil.xmlToMap(error.response?.data);

          final envelope = Envelope.fromJson(jsonMap);

          if (envelope.body.hasFault) {
            throw Exception('Error code: ${envelope.body.fault}');
          }
          break;
      }

      throw Exception(error);
    }

    return Envelope.fromXmlString(response.data);
  }

  static XmlDocumentFragment quickTag(
    String tagName,
    String nameSpace,
  ) {
    Transport.builder.element(tagName, nest: () {
      Transport.builder.namespace(nameSpace);
    });

    return Transport.builder.buildFragment();
  }

  XmlDocumentFragment getSecurityHeader({
    Authorization? authorization,
  }) {
    authorization ??= Authorization(
      authInfo: authInfo,
      timeStamp: DateTime.now(),
      timeDelta: timeDelta,
    );

    final securityHeader = Transport.security(
        username: authInfo.username,
        password: authorization.digest,
        nonce: authorization.nonce.toBase64(),
        created: authorization.utcTimeStamp);

    return securityHeader;
  }

  /// XML for the SOAP envelope
  XmlDocument envelope(XmlDocumentFragment? header, XmlDocumentFragment body) {
    builder.declaration(encoding: 'UTF-8');

    builder.element('Envelope',
        namespace: Xmlns.s,
        namespaces: {Xmlns.s: 's', 'http://www.w3.org/2005/08/addressing': 'a'},
        nest: () {
      builder.element('Header', namespace: Xmlns.s, nest: header);

      builder.element('Body',
          namespace: Xmlns.s,
          namespaces: {
            'http://www.w3.org/2001/XMLSchema-instance': 'xsi',
            Xmlns.xsd: 'xsd'
          },
          nest: body);
    });

    return builder.buildDocument();
  }

  /// XML for the SOAP envelope
  XmlDocument securedEnvelope(XmlDocumentFragment body) =>
      envelope(getSecurityHeader(), body);

  /// XML for the SOAP [security]
  static XmlDocumentFragment security(
      {required String username,
      required String password,
      required String nonce,
      required String created}) {
    builder.element('Security', namespaces: {Xmlns.s: 's'}, nest: () {
      builder.namespace(
          'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd');
      builder.attribute('mustUnderstand', 1, namespace: Xmlns.s);
      builder.element('UsernameToken', nest: () {
        builder.element('Username', nest: username);
        builder.element('Password',
            attributes: {
              'Type':
                  'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordDigest'
            },
            nest: password);
        builder.element('Nonce',
            attributes: {
              'EncodingType':
                  'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'
            },
            nest: nonce);
        builder.element('Created', nest: () {
          builder.namespace(
              'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd');
          builder.text(created);
        });
      });
    });

    return builder.buildFragment();
  }

  static XmlDocument probe(String messageId) {
    builder.declaration(encoding: 'UTF-8');

    builder.element('Envelope',
        namespace: 'http://www.w3.org/2003/05/soap-envelope', nest: () {
      builder.namespace('http://www.w3.org/2003/05/soap-envelope', 's');
      builder.namespace(
          'http://schemas.xmlsoap.org/ws/2004/08/addressing', 'a');
      builder.namespace('http://schemas.xmlsoap.org/ws/2005/04/discovery', 'd');

      builder.element('Header',
          namespace: 'http://www.w3.org/2003/05/soap-envelope', nest: () {
        builder.element('MessageID',
            namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
            nest: 'uuid:$messageId');
        builder.element('To',
            namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
            nest: () {
          builder.attribute('mustUnderstand', 'true',
              namespace: 'http://www.w3.org/2003/05/soap-envelope');
          builder.text('urn:schemas-xmlsoap-org:ws:2005:04:discovery');
        });
        builder.element('ReplyTo',
            namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
            nest: () {
          builder.element('Address',
              namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
              nest: () {
            builder.text(
                'http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous');
          });
        });
        builder.element('Action',
            namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
            nest: () {
          builder.attribute('mustUnderstand', 'true',
              namespace: 'http://www.w3.org/2003/05/soap-envelope');
          builder.text('http://schemas.xmlsoap.org/ws/2005/04/discovery/Probe');
        });
      });

      builder.element('Body',
          namespace: 'http://www.w3.org/2003/05/soap-envelope', nest: () {
        builder.element('Probe',
            namespace: 'http://schemas.xmlsoap.org/ws/2005/04/discovery',
            nest: () {
          builder.element('Types',
              namespace: 'http://schemas.xmlsoap.org/ws/2005/04/discovery',
              nest: () {
            builder.namespace(Xmlns.dn, 'dn');
            builder.namespace(Xmlns.tds, 'tds');

            builder.text('dn:NetworkVideoTransmitter  tds:Device');
          });
        });
      });
    });

    return builder.buildDocument();
  }
}
