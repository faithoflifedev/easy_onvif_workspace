import 'package:json_annotation/json_annotation.dart';

part 'time.g.dart';

@JsonSerializable(explicitToJson: true)
class Time {
  @JsonKey(name: 'Hour')
  final dynamic xmlHour;

  @JsonKey(name: 'Minute')
  final dynamic xmlMinute;

  @JsonKey(name: 'Second')
  final dynamic xmlSecond;

  int get hour => int.parse(xmlHour['\$']);

  int get minute => int.parse(xmlMinute['\$']);

  int get second => int.parse(xmlSecond['\$']);

  Time(this.xmlHour, this.xmlMinute, this.xmlSecond);

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToJson(this);
}
