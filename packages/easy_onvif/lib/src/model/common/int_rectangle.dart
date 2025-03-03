import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'int_rectangle.g.dart';

/// Rectangle specifying the Video capturing area. The capturing area shall not
/// be larger than the whole Video source area.
@JsonSerializable()
class IntRectangle {
  @JsonKey(name: '@x', fromJson: int.parse)
  final int x;

  @JsonKey(name: '@y', fromJson: int.parse)
  final int y;

  @JsonKey(name: '@width', fromJson: int.parse)
  final int width;

  @JsonKey(name: '@height', fromJson: int.parse)
  final int height;

  IntRectangle({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  factory IntRectangle.fromJson(Map<String, dynamic> json) =>
      _$IntRectangleFromJson(json);

  Map<String, dynamic> toJson() => _$IntRectangleToJson(this);

  @override
  String toString() => json.encode(toJson());
}
