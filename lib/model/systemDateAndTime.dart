import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'dateTime.dart';
import 'timeZone.dart';

part 'systemDateAndTime.g.dart';

///Contains information whether system date and time are set manually or by NTP,
///daylight savings is on or off, time zone in POSIX 1003.1 format and system
///date and time in UTC and also local system date and time.
@JsonSerializable(explicitToJson: true)
class SystemDateAndTime {
  @JsonKey(name: 'DateTimeType')
  final dynamic xmlDateTimeType;

  @JsonKey(name: 'DaylightSavings')
  final dynamic xmlDaylightSavings;

  ///Timezone information in Posix format.
  @JsonKey(name: 'TimeZone')
  final TimeZone? timeZone;

  ///Current system date and time in UTC format. This field is mandatory since
  ///version 2.0.
  @JsonKey(name: 'UTCDateTime')
  final OnvifDateTime? utc;

  ///Date and time in local format.
  @JsonKey(name: 'LocalDateTime')
  final OnvifDateTime? local;

  ///Indicates if the time is set manully or through NTP.
  ///- enum { 'Manual', 'NTP' }
  String get dateTimeType => xmlDateTimeType['\$'];

  ///Informative indicator whether daylight savings is currently on/off.
  String get daylightSavings => xmlDaylightSavings['\$'];

  SystemDateAndTime(
      {required this.xmlDateTimeType,
      required this.xmlDaylightSavings,
      this.timeZone,
      this.utc,
      this.local});

  factory SystemDateAndTime.fromJson(Map<String, dynamic> json) =>
      _$SystemDateAndTimeFromJson(json);

  Map<String, dynamic> toJson() => _$SystemDateAndTimeToJson(this);

  DateTime? get utcDateTime => utc?.dateTime;

  DateTime? get localDateTime => local?.dateTime;

  @override
  String toString() => json.encode(toJson());
}
