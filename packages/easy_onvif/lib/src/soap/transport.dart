import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/soap.dart';
import 'package:easy_onvif/util.dart';
import 'package:loggy/loggy.dart';
import 'package:xml/xml.dart';

/// Utility class for interacting through the SOAP protocol
class Transport with UiLoggy {
  final Dio dio;

  final AuthInfo authInfo;

  final bool overrideSpecificationAuthentication;

  static Duration timeDelta = Duration.zero;

  static final builder = XmlBuilder();

  Transport({
    required this.dio,
    required this.authInfo,
    this.overrideSpecificationAuthentication = false,
  });

  /// Send the SOAP [requestData] to the given [url] endpoint.
  Future<Response<Uint8List>> sendLogRequest(
      Uri uri, XmlDocument requestData) async {
    Response<Uint8List> response;

    try {
      response = await dio.post<Uint8List>(uri.toString(),
          data: requestData.toString(),
          options: Options(
            responseType: ResponseType.bytes,
            headers: {
              // Headers.contentTypeHeader: 'text/xml; charset=utf-8',
              Headers.contentTypeHeader: 'application/soap+xml; charset=utf-8',
            },
          ));
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

    return response;
  }

  /// Send the SOAP [requestData] to the given [url] endpoint.
  Future<Envelope> sendRequest(Uri uri, XmlDocument requestData) async {
    Response response;

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

  /// XML for the SOAP envelope
  Envelope getEnvelope(Body body) => Envelope(
        body: body,
        header: Header(),
      );

  /// XML for the SOAP envelope
  Envelope getSecuredEnvelope(
    Body body, [
    Authorization? authorization,
  ]) =>
      Envelope(
        body: body,
        header: Header(
          security: Security(
            usernameToken: UsernameToken(
                authorization: authorization ??
                    Authorization(
                      authInfo: authInfo,
                      timeDelta: timeDelta,
                    )),
            mustUnderstand: 1,
          ),
        ),
      );

  Future<Envelope> request(Uri uri, Body body) async => await sendRequest(
        uri,
        getEnvelope(body).toXml(builder),
      );

  Future<Envelope> securedRequest(Uri uri, Body body) async =>
      await sendRequest(
        uri,
        getSecuredEnvelope(body).toXml(builder),
      );

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
