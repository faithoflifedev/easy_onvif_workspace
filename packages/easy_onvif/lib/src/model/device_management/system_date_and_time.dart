import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'date_time.dart';
import 'time_zone.dart';

part 'system_date_and_time.g.dart';

/// Contains information whether system date and time are set manually or by NTP, daylight savings is on or off, time zone in POSIX 1003.1 format and system date and time in UTC and also local system date and time.
@JsonSerializable()
class SystemDateAndTime {
  /// Indicates if the time is set manually or through NTP.
  /// - enum { 'Manual', 'NTP' }
  @JsonKey(
      name: 'DateTimeType', fromJson: OnvifUtil.nullableStringMappedFromXml)
  final String? dateTimeType;

  /// Informative indicator whether daylight savings is currently on/off.
  @JsonKey(
      name: 'DaylightSavings', fromJson: OnvifUtil.nullableStringMappedFromXml)
  final String? daylightSavings;

  /// Timezone information in Posix format.
  @JsonKey(name: 'TimeZone')
  final TimeZone? timeZone;

  /// Current system date and time in UTC format. This field is mandatory since version 2.0.
  @JsonKey(name: 'UTCDateTime')
  final OnvifDateTime? utc;

  /// Date and time in local format.
  @JsonKey(name: 'LocalDateTime')
  final OnvifDateTime? local;

  SystemDateAndTime({
    required this.dateTimeType,
    required this.daylightSavings,
    this.timeZone,
    this.utc,
    this.local,
  });

  factory SystemDateAndTime.fromJson(Map<String, dynamic> json) =>
      _$SystemDateAndTimeFromJson(json);

  Map<String, dynamic> toJson() => _$SystemDateAndTimeToJson(this);

  DateTime? get utcDateTime => utc?.dateTime;

  DateTime? get localDateTime => local?.dateTime;

  @override
  String toString() => json.encode(toJson());
}
