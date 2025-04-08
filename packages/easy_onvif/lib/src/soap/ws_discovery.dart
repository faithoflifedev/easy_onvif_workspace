import 'package:dio/dio.dart';
import 'package:easy_onvif/soap.dart';
import 'package:uuid/uuid.dart';
import 'package:xml/xml.dart';

class WsDiscovery {
  final Dio dio;

  static final builder = Transport.builder;

  WsDiscovery({required this.dio});

  static String get uuid => Uuid().v4();

  /// Creates a Hello message for WS-Discovery.
  static XmlDocument hello({
    required List<String> xAddrs,
    required int messageNumber,
    String? messageId,
    String? address,
    List<String> scopes = const ['onvif://www.onvif.org/location/country/US'],
  }) {
    builder.declaration(encoding: 'UTF-8');

    builder.element(
      'Envelope',
      namespace: 'http://www.w3.org/2003/05/soap-envelope',
      nest: () {
        builder.namespace('http://www.w3.org/2003/05/soap-envelope', 's');
        builder.namespace(
          'http://schemas.xmlsoap.org/ws/2004/08/addressing',
          'a',
        );
        builder.namespace(
          'http://schemas.xmlsoap.org/ws/2005/04/discovery',
          'd',
        );

        builder.element(
          'Header',
          // namespace: 'http://www.w3.org/2003/05/soap-envelope',
          nest: () {
            builder.element(
              'Action',
              namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
              nest: 'http://schemas.xmlsoap.org/ws/2005/04/discovery/Hello',
            );

            builder.element(
              'MessageID',
              namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
              nest: 'uuid:${messageId ?? uuid}',
            );

            builder.element(
              'AppSequence',
              namespace: 'http://schemas.xmlsoap.org/ws/2005/04/discovery',
              nest: () {
                builder.attribute('InstanceId', '1');

                builder.attribute('SequenceId', 'urn:uuid:$uuid');

                builder.attribute('MessageNumber', '$messageNumber');
              },
            );
          },
        );

        builder.element(
          'Body',
          // namespace: 'http://www.w3.org/2003/05/soap-envelope',
          nest: () {
            builder.element(
              'Hello',
              namespace: 'http://schemas.xmlsoap.org/ws/2005/04/discovery',
              nest: () {
                builder.element(
                  'EndpointReference',
                  namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
                  nest: () {
                    builder.element(
                      'Address',
                      // namespace:
                      //     'http://schemas.xmlsoap.org/ws/2004/08/addressing',
                      nest: 'urn:uuid:$address',
                    );
                  },
                );

                builder.element('Types', nest: 'dn:NetworkVideoTransmitter');

                for (var scope in scopes) {
                  builder.element('Scopes', nest: scope);
                }

                for (var xAddr in xAddrs) {
                  builder.element('XAddrs', nest: xAddr);
                }

                builder.element('MetadataVersion', nest: '1');
              },
            );
          },
        );
      },
    );

    return builder.buildDocument();
  }

  static XmlDocument bye({String? messageId, String? address}) {
    builder.declaration(encoding: 'UTF-8');

    builder.element(
      'Envelope',
      namespace: 'http://www.w3.org/2003/05/soap-envelope',
      nest: () {
        builder.namespace('http://www.w3.org/2003/05/soap-envelope', 's');

        builder.namespace(
          'http://schemas.xmlsoap.org/ws/2004/08/addressing',
          'a',
        );

        builder.namespace(
          'http://schemas.xmlsoap.org/ws/2005/04/discovery',
          'd',
        );

        builder.element(
          'Header',
          // namespace: 'http://www.w3.org/2003/05/soap-envelope',
          nest: () {
            builder.element(
              'Action',
              namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
              nest: 'http://schemas.xmlsoap.org/ws/2005/04/discovery/Bye',
            );

            builder.element(
              'MessageID',
              namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
              nest: 'uuid:${messageId ?? uuid}',
            );
          },
        );

        builder.element(
          'Body',
          nest: () {
            builder.element(
              'Bye',
              namespace: 'http://schemas.xmlsoap.org/ws/2005/04/discovery',
              nest: () {
                builder.element(
                  'EndpointReference',
                  namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
                  nest: () {
                    builder.element(
                      'Address',
                      nest: 'urn:uuid:${address ?? uuid}',
                    );
                  },
                );
              },
            );
          },
        );
      },
    );

    return builder.buildDocument();
  }

  static XmlDocument probe({String? messageId}) {
    builder.declaration(encoding: 'UTF-8');

    builder.element(
      'Envelope',
      namespace: 'http://www.w3.org/2003/05/soap-envelope',
      nest: () {
        builder.namespace('http://www.w3.org/2003/05/soap-envelope', 's');
        builder.namespace(
          'http://schemas.xmlsoap.org/ws/2004/08/addressing',
          'a',
        );
        builder.namespace(
          'http://schemas.xmlsoap.org/ws/2005/04/discovery',
          'd',
        );

        builder.element(
          'Header',
          namespace: 'http://www.w3.org/2003/05/soap-envelope',
          nest: () {
            builder.element(
              'MessageID',
              namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
              nest: 'uuid:${messageId ?? uuid}',
            );

            builder.element(
              'To',
              namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
              nest: () {
                builder.attribute(
                  'mustUnderstand',
                  'true',
                  namespace: 'http://www.w3.org/2003/05/soap-envelope',
                );
                builder.text('urn:schemas-xmlsoap-org:ws:2005:04:discovery');
              },
            );

            builder.element(
              'ReplyTo',
              namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
              nest: () {
                builder.element(
                  'Address',
                  namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
                  nest: () {
                    builder.text(
                      'http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous',
                    );
                  },
                );
              },
            );

            builder.element(
              'Action',
              namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
              nest: () {
                builder.attribute(
                  'mustUnderstand',
                  'true',
                  namespace: 'http://www.w3.org/2003/05/soap-envelope',
                );
                builder.text(
                  'http://schemas.xmlsoap.org/ws/2005/04/discovery/Probe',
                );
              },
            );
          },
        );

        builder.element(
          'Body',
          namespace: 'http://www.w3.org/2003/05/soap-envelope',
          nest: () {
            builder.element(
              'Probe',
              namespace: 'http://schemas.xmlsoap.org/ws/2005/04/discovery',
              nest: () {
                builder.element(
                  'Types',
                  namespace: 'http://schemas.xmlsoap.org/ws/2005/04/discovery',
                  nest: () {
                    builder.namespace(Xmlns.dn, 'dn');
                    builder.namespace(Xmlns.tds, 'tds');

                    builder.text('dn:NetworkVideoTransmitter  tds:Device');
                  },
                );
              },
            );
          },
        );
      },
    );

    return builder.buildDocument();
  }
}
