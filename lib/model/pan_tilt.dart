import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pan_tilt.g.dart';

@JsonSerializable()
class PanTilt {
  @JsonKey(name: '@x', fromJson: double.parse)
  final double x;

  @JsonKey(name: '@y', fromJson: double.parse)
  final double y;

  @JsonKey(name: '@space')
  final String? space;

  PanTilt({required this.x, required this.y, this.space});

  factory PanTilt.fromString({required String x, required String y}) =>
      PanTilt(x: double.parse(x), y: double.parse(y));

  ///helper to allow an int for 1 - 10000 in place of the double
  factory PanTilt.fromInt({required int x, required int y}) =>
      PanTilt(x: x == 0 ? 0 : (x / 10000.0), y: y == 0 ? 0 : (y / 10000.0));

  factory PanTilt.fromJson(Map<String, dynamic> json) =>
      _$PanTiltFromJson(json);

  Map<String, dynamic> toJson() => _$PanTiltToJson(this);

  @override
  String toString() => json.encode(toJson());
}
