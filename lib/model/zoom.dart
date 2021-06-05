import 'package:json_annotation/json_annotation.dart';

part 'zoom.g.dart';

@JsonSerializable()
class Zoom {
  @JsonKey(name: '@x')
  final String rawX;

  @JsonKey(name: '@space')
  final String? space;
  double get x => double.parse(rawX);

  Zoom({required this.rawX, this.space});

  factory Zoom.fromDouble(double x) => Zoom(rawX: x.toString());

  factory Zoom.fromJson(Map<String, dynamic> json) => _$ZoomFromJson(json);

  Map<String, dynamic> toJson() => _$ZoomToJson(this);
}
