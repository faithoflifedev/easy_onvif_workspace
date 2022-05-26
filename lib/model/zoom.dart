import 'package:json_annotation/json_annotation.dart';

part 'zoom.g.dart';

@JsonSerializable()
class Zoom {
  @JsonKey(name: '@x', fromJson: double.parse)
  final double x;

  @JsonKey(name: '@space')
  final String? space;

  Zoom({required this.x, this.space});

  factory Zoom.fromString({required String x}) => Zoom(x: double.parse(x));

  factory Zoom.fromInt({required int x}) => Zoom(x: x == 0 ? 0 : (x / 10000.0));

  factory Zoom.fromJson(Map<String, dynamic> json) => _$ZoomFromJson(json);

  Map<String, dynamic> toJson() => _$ZoomToJson(this);
}
