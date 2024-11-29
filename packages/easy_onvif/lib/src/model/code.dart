import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'code.g.dart';

@JsonSerializable()
class Code {
  @JsonKey(
    name: 'Value',
    fromJson: OnvifUtil.nullableStringMappedFromXml,
  )
  final String? value;

  @JsonKey(name: 'Subcode')
  final Map<String, dynamic>? subCode;

  Code({
    this.value,
    this.subCode,
  });

  factory Code.fromJson(Map<String, dynamic> json) => _$CodeFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CodeToJson(this).convertFieldToXmlMap('Value');

  @override
  String toString() => json.encode(toJson());
}
