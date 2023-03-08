import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'code.g.dart';

@JsonSerializable()
class Code {
  @JsonKey(name: 'Value', fromJson: OnvifUtil.nullableMappedToString)
  final String? value;

  @JsonKey(name: 'Subcode')
  final Map<String, dynamic>? subCode;

  Code({
    this.value,
    this.subCode,
  });

  factory Code.fromJson(Map<String, dynamic> json) => _$CodeFromJson(json);

  Map<String, dynamic> toJson() => _$CodeToJson(this);

  @override
  String toString() => json.encode(toJson());
}
