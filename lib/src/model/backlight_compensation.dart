import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'backlight_compensation.g.dart';

///List of existing Video Sources
@JsonSerializable(explicitToJson: true)
class BacklightCompensation {
  ///Enabled/disabled BLC mode (on/off).
  @JsonKey(name: 'Mode', fromJson: OnvifUtil.mappedToString)
  final String mode;

  ///Optional level parameter (unit unspecified).
  @JsonKey(name: 'Level', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? level;

  BacklightCompensation({required this.mode, required this.level});

  factory BacklightCompensation.fromJson(Map<String, dynamic> json) =>
      _$BacklightCompensationFromJson(json);

  Map<String, dynamic> toJson() => _$BacklightCompensationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
