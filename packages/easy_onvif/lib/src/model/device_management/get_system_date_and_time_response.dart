import 'package:json_annotation/json_annotation.dart';

import 'system_date_and_time.dart';

part 'get_system_date_and_time_response.g.dart';

/// Contains information whether system date and time are set manually or by
/// NTP, daylight savings is on or off, time zone in POSIX 1003.1 format and
/// system date and time in UTC and also local system date and time.
@JsonSerializable()
class GetSystemDateAndTimeResponse {
  @JsonKey(name: 'SystemDateAndTime')
  final SystemDateAndTime systemDateAndTime;

  GetSystemDateAndTimeResponse({required this.systemDateAndTime});

  factory GetSystemDateAndTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSystemDateAndTimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSystemDateAndTimeResponseToJson(this);
}
