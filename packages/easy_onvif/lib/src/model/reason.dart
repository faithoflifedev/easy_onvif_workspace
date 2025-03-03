import 'dart:convert';

import 'package:easy_onvif/util.dart';

class Reason {
  final String? lang;

  final String? note;

  Reason({this.lang, this.note});

  factory Reason.fromJson(Map<String, dynamic> json) => Reason(
    lang: json['Text']['@xml:lang'],
    note: OnvifUtil.stringMappedFromXml(json['Text']),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'lang': lang,
    'note': note,
  };

  @override
  String toString() => json.encode(toJson());
}
