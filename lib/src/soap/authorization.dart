import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/soap.dart';
import 'package:intl/intl.dart';

/// Implementation of the [Authorization] algorithm required to authenticate to
/// Onvif devices
class Authorization {
  late final Nonce nonce;

  final AuthInfo authInfo;

  final DateTime timeStamp;

  final Duration timeDelta;

  final Nonce? nonceOverride;

  String get utcTimeStamp => DateFormat('yyyy-MM-DD\'T\'HH:mm:ss\'Z\'')
      .format(timeStamp.add(timeDelta));

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
