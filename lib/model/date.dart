import 'dart:convert';

import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'date.g.dart';

@JsonSerializable(explicitToJson: true)
class Date {
  @JsonKey(name: 'Year', fromJson: OnvifUtil.mappedToInt)
  final int year;

  @JsonKey(name: 'Month', fromJson: OnvifUtil.mappedToInt)
  final int month;

  @JsonKey(name: 'Day', fromJson: OnvifUtil.mappedToInt)
  final int day;

  Date(this.year, this.month, this.day);

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);

  @override
  String toString() => json.encode(toJson());
}
