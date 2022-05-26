import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time.g.dart';

@JsonSerializable(explicitToJson: true)
class Time {
  @JsonKey(name: 'Hour', fromJson: OnvifUtil.mappedToInt)
  final dynamic hour;

  @JsonKey(name: 'Minute', fromJson: OnvifUtil.mappedToInt)
  final dynamic minute;

  @JsonKey(name: 'Second', fromJson: OnvifUtil.mappedToInt)
  final dynamic second;

  Time({required this.hour, required this.minute, required this.second});

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToJson(this);

  @override
  String toString() => json.encode(toJson());
}
