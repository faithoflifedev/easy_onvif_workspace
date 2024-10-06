import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wide_dynamic_range.g.dart';

///WDR settings.
@JsonSerializable()
class WideDynamicRange {
  ///White dynamic range (on/off)
  ///- enum { 'OFF', 'ON' }
  @JsonKey(name: 'Mode', fromJson: OnvifUtil.mappedToString)
  final String mode;

  ///Optional level parameter (unit-less)
  @JsonKey(name: 'Level', fromJson: OnvifUtil.mappedToDouble)
  final double? level;

  WideDynamicRange({required this.mode, required this.level});

  factory WideDynamicRange.fromJson(Map<String, dynamic> json) =>
      _$WideDynamicRangeFromJson(json);

  Map<String, dynamic> toJson() => _$WideDynamicRangeToJson(this);

  @override
  String toString() => json.encode(toJson());
}
