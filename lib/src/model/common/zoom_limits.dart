import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'space1d.dart';

part 'zoom_limits.g.dart';

///A range of x or y-axis.
@JsonSerializable()
class ZoomLimits {
  ///Capability information.
  @JsonKey(name: 'Range')
  final Space1D range;

  ZoomLimits({required this.range});

  factory ZoomLimits.fromJson(Map<String, dynamic> json) =>
      _$ZoomLimitsFromJson(json);

  Map<String, dynamic> toJson() => _$ZoomLimitsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
