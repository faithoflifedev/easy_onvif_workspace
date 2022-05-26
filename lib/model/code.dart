import 'dart:convert';

import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'code.g.dart';

@JsonSerializable(explicitToJson: true)
class Code {
  @JsonKey(name: 'Value', fromJson: OnvifUtil.mappedToString)
  final String value;

  @JsonKey(name: 'Subcode')
  final Code? code;

  Code({required this.value, this.code});

  factory Code.fromJson(Map<String, dynamic> json) => _$CodeFromJson(json);

  Map<String, dynamic> toJson() => _$CodeToJson(this);

  @override
  String toString() => json.encode(toJson());
}
