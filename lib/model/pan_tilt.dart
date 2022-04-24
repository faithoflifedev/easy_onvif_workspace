import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pan_tilt.g.dart';

@JsonSerializable()
class PanTilt {
  @JsonKey(name: '@x')
  final String rawX;

  @JsonKey(name: '@y')
  final String rawY;

  @JsonKey(name: '@space')
  final String? space;

  double get x => double.parse(rawX);

  double get y => double.parse(rawY);

  PanTilt({required this.rawX, required this.rawY, this.space});

  ///assumes can tilt between values 0 and 1 (can be confirmed through the
  ///config)
  factory PanTilt.fromDouble({double x = 0.1, double y = 0.1}) =>
      PanTilt(rawX: x.toString(), rawY: y.toString());

  ///helper to allow an int for 1 - 10000 in place of the double
  factory PanTilt.fromInt({int x = 1000, int y = 1000}) => PanTilt(
      rawX: (x == 0 ? 0 : (x / 10000)).toString(),
      rawY: (y == 0 ? 0 : (y / 10000)).toString());

  factory PanTilt.fromJson(Map<String, dynamic> json) =>
      _$PanTiltFromJson(json);

  Map<String, dynamic> toJson() => _$PanTiltToJson(this);

  @override
  String toString() => json.encode(toJson());
}
