import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'space2d.dart';

part 'pan_tilt_limits.g.dart';

///A range of x or y-axis.
@JsonSerializable()
class PanTiltLimits {
  ///Capability information.
  @JsonKey(name: 'Range')
  final Space2D range;

  PanTiltLimits({required this.range});

  factory PanTiltLimits.fromJson(Map<String, dynamic> json) =>
      _$PanTiltLimitsFromJson(json);

  Map<String, dynamic> toJson() => _$PanTiltLimitsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
