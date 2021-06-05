import 'package:json_annotation/json_annotation.dart';

part 'panTilt.g.dart';

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

  factory PanTilt.fromDouble({double x = 0.1, double y = 0.1}) {
    return PanTilt(rawX: x.toString(), rawY: y.toString());
  }

  factory PanTilt.fromJson(Map<String, dynamic> json) =>
      _$PanTiltFromJson(json);

  Map<String, dynamic> toJson() => _$PanTiltToJson(this);
}
