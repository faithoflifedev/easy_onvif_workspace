import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:easy_onvif/soap.dart';
import 'package:intl/intl.dart';

/// Implementation of the [Authorization] algorithm required to authenticate to
/// Onvif devices
class Authorization {
  late final Nonce nonce;

  final Nonce? nonceOverride;

  final String password;

  final DateTime timeStamp;

  final Duration timeDelta;

  String get utcTimeStamp => DateFormat('yyyy-MM-DD\'T\'HH:mm:ss\'Z\'')
      .format(timeStamp.add(timeDelta));

  String get digest => base64.encode(sha1
      .convert(nonce.bytes + utf8.encode(utcTimeStamp) + utf8.encode(password))
      .bytes);

  Authorization({
    required this.password,
    required this.timeStamp,
    required this.timeDelta,
    this.nonceOverride,
  }) {
    nonce = nonceOverride ?? Nonce();
  }
}
