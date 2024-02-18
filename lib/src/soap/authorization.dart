import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/soap.dart';

/// Implementation of the [Authorization] algorithm required to authenticate to
/// Onvif devices
class Authorization {
  late final Nonce nonce;

  final AuthInfo authInfo;

  final DateTime timeStamp;

  final Duration timeDelta;

  /// During testing use a user generated Nonce so that results can be validated.
  final Nonce? nonceOverride;

  String get utcTimeStamp => timeStamp.add(timeDelta).toIso8601String();

  String get digest => base64.encode(sha1
      .convert(nonce.bytes +
          utf8.encode(utcTimeStamp) +
          utf8.encode(authInfo.password))
      .bytes);

  Authorization({
    required this.authInfo,
    required this.timeStamp,
    required this.timeDelta,
    this.nonceOverride,
  }) {
    nonce = nonceOverride ?? Nonce();
  }
}
