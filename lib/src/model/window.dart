import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'window.g.dart';

@JsonSerializable()
class Window {
  @JsonKey(name: '@bottom', fromJson: int.parse)
  final int bottom;

  @JsonKey(name: '@top', fromJson: int.parse)
  final int top;

  @JsonKey(name: '@right', fromJson: int.parse)
  final int right;

  @JsonKey(name: '@left', fromJson: int.parse)
  final int left;

  Window(
      {required this.bottom,
      required this.top,
      required this.right,
      required this.left});

  factory Window.fromJson(Map<String, dynamic> json) => _$WindowFromJson(json);

  Map<String, dynamic> toJson() => _$WindowToJson(this);

  @override
  String toString() => json.encode(toJson());
}
