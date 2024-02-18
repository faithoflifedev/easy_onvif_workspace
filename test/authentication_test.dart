import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:dio/dio.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/soap.dart';

import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  group('Authorization', () {
    final authInfo = AuthInfo(
      host: 'localhost',
      username: 'admin',
      password: 'password',
    );

    final authorization = Authorization(
      authInfo: authInfo,
      timeStamp: DateTime(2024, 1, 20, 16, 10, 0),
      timeDelta: Duration(seconds: 0),
      nonceOverride: Nonce(
          bytesOverride: hex.decode(
        '0102030405060708090A0B0C0D0E0F10',
      )),
    );

    test('generate valid nonce and digest', () {
      expect(authorization.digest, 'ZLSXZSjr+AeSFHLrsrK9jhEXjls=');
      expect(authorization.nonce.toBase64(), 'AQIDBAUGBwgJCgsMDQ4PEA==');
      expect(authorization.utcTimeStamp, '2024-01-20T16:10:00.000');
    });

    test('generate valid security header', () {
      final transport = Transport(
        dio: Dio(),
        authInfo: authInfo,
      );

      final securityHeader = transport.getSecurityHeader(
        authorization: authorization,
      );

      final jsonTransformer = Xml2Json();

      jsonTransformer.parse(securityHeader.lastChild!.toXmlString());

      final json = jsonDecode(jsonTransformer.toBadgerfish());

      expect(json['Security']['UsernameToken']['Username']['\$'], 'admin');
      expect(json['Security']['UsernameToken']['Password']['\$'],
          'ZLSXZSjr+AeSFHLrsrK9jhEXjls=');
      expect(json['Security']['UsernameToken']['Nonce']['\$'],
          'AQIDBAUGBwgJCgsMDQ4PEA==');
      expect(json['Security']['UsernameToken']['Created']['\$'],
          '2024-01-20T16:10:00.000');
    });
  });
}
