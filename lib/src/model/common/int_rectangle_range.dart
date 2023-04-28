import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'int_range.dart';

part 'int_rectangle_range.g.dart';

/// Rectangle specifying the Video capturing area. The capturing area shall not
/// be larger than the whole Video source area.
@JsonSerializable()
class IntRectangleRange {
  /// Range of X-axis.
  @JsonKey(name: 'XRange')
  final IntRange xRange;

  /// Range of Y-axis.
  @JsonKey(name: 'YRange')
  final IntRange yRange;

  /// Range of width.
  @JsonKey(name: 'WidthRange')
  final IntRange widthRange;

  /// Range of height.
  @JsonKey(name: 'HeightRange')
  final IntRange heightRange;

  IntRectangleRange(
      {required this.xRange,
      required this.yRange,
      required this.widthRange,
      required this.heightRange});

  factory IntRectangleRange.fromJson(Map<String, dynamic> json) =>
      _$IntRectangleRangeFromJson(json);

  Map<String, dynamic> toJson() => _$IntRectangleRangeToJson(this);

  @override
  String toString() => json.encode(toJson());
}
