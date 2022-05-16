import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'bounds.g.dart';

///Rectangle specifying the Video capturing area. The capturing area shall not
///be larger than the whole Video source area.
@JsonSerializable()
class Bounds {
  @JsonKey(name: '@x', fromJson: int.parse)
  final int x;

  @JsonKey(name: '@y', fromJson: int.parse)
  final int y;

  @JsonKey(name: '@width', fromJson: int.parse)
  final int width;

  @JsonKey(name: '@height', fromJson: int.parse)
  final int height;

  Bounds(
      {required this.x,
      required this.y,
      required this.width,
      required this.height});

  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);

  Map<String, dynamic> toJson() => _$BoundsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
