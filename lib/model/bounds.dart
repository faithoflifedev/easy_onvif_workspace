import 'package:json_annotation/json_annotation.dart';

part 'bounds.g.dart';

@JsonSerializable()
class Bounds {
  @JsonKey(name: '@x')
  final String xmlX;

  @JsonKey(name: '@y')
  final String xmlY;

  @JsonKey(name: '@width')
  final String xmlWidth;

  @JsonKey(name: '@height')
  final String xmlHeight;

  int get x => int.parse(xmlX);

  int get y => int.parse(xmlY);

  int get width => int.parse(xmlWidth);

  int get height => int.parse(xmlHeight);

  Bounds(this.xmlX, this.xmlY, this.xmlWidth, this.xmlHeight);

  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);

  Map<String, dynamic> toJson() => _$BoundsToJson(this);
}
