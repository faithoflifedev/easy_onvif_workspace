import 'package:json_annotation/json_annotation.dart';

part 'resolution.g.dart';

@JsonSerializable()
class Resolution {
  @JsonKey(name: 'Width')
  final dynamic xmlWidth;

  @JsonKey(name: 'Height')
  final dynamic xmlHeight;

  int get width => int.parse(xmlWidth['\$']);

  int get height => int.parse(xmlHeight['\$']);

  Resolution(this.xmlWidth, this.xmlHeight);

  factory Resolution.fromJson(Map<String, dynamic> json) =>
      _$ResolutionFromJson(json);

  Map<String, dynamic> toJson() => _$ResolutionToJson(this);
}
