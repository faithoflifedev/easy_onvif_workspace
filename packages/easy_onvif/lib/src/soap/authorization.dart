import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/soap.dart';

/// Implementation of the [Authorization] algorithm required to authenticate to
/// Onvif devices
class Authorization {
  late final Nonce nonce;

  late final DateTime _timestamp;

  final AuthInfo authInfo;

  final DateTime? timestampOverride;

  final Duration timeDelta;

  /// During testing use a user generated Nonce so that results can be validated.
  final Nonce? nonceOverride;

  String get utcTimestamp =>
      _timestamp.toUtc().add(timeDelta).toIso8601String();

  String get digest => base64.encode(
    sha1
        .convert(
          nonce.bytes +
              utf8.encode(utcTimestamp) +
              utf8.encode(authInfo.password),
        )
        .bytes,
  );

  Authorization({
    required this.authInfo,
    required this.timeDelta,
    this.timestampOverride,
    this.nonceOverride,
  }) {
    nonce = nonceOverride ?? Nonce();

    _timestamp = timestampOverride ?? DateTime.now();
  }
}
