import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../onvif.dart';

///Implementation of the [Authorization] algorithm required to authenticate to
///Onvif devices
class Authorization {
  final Nonce _nonce = Nonce();

  final String password;
  final String timeStamp;

  final Duration timeDelta;

  //Calculate the digest used in the SOAP authorization header
  late final String digest = base64.encode(sha1
      .convert([
        ..._nonce.bytes,
        ...utf8.encode(timeStamp),
        ...utf8.encode(password)
      ].toList())
      .bytes);

  String get nonce => _nonce.toBase64();

  Authorization({required this.password, required this.timeDelta})
      : timeStamp = DateTime.now().toUtc().add(timeDelta).toIso8601String();
}
