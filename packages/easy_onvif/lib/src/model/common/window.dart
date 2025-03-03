import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'window.g.dart';

@JsonSerializable()
class Window {
  @JsonKey(name: '@bottom', fromJson: double.parse)
  final double bottom;

  @JsonKey(name: '@top', fromJson: double.parse)
  final double top;

  @JsonKey(name: '@right', fromJson: double.parse)
  final double right;

  @JsonKey(name: '@left', fromJson: double.parse)
  final double left;

  Window({
    required this.bottom,
    required this.top,
    required this.right,
    required this.left,
  });

  factory Window.fromJson(Map<String, dynamic> json) => _$WindowFromJson(json);

  Map<String, dynamic> toJson() => _$WindowToJson(this);

  @override
  String toString() => json.encode(toJson());
}
