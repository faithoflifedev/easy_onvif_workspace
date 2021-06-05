import 'package:json_annotation/json_annotation.dart';

import 'dateTime.dart';
import 'timeZone.dart';

part 'systemDateAndTime.g.dart';

@JsonSerializable(explicitToJson: true)
class SystemDateAndTime {
  @JsonKey(name: 'DateTimeType')
  final dynamic xmlDateTimeType;

  @JsonKey(name: 'DaylightSavings')
  final dynamic xmlDaylightSavings;

  @JsonKey(name: 'TimeZone')
  final TimeZone timeZone;

  @JsonKey(name: 'UTCDateTime')
  final OnvifDateTime utc;

  @JsonKey(name: 'LocalDateTime')
  final OnvifDateTime local;

  String get dateTimeType => xmlDateTimeType['\$'];

  String get daylightSavings => xmlDaylightSavings['\$'];

  SystemDateAndTime(this.xmlDateTimeType, this.xmlDaylightSavings,
      this.timeZone, this.utc, this.local);

  factory SystemDateAndTime.fromJson(Map<String, dynamic> json) =>
      _$SystemDateAndTimeFromJson(json);

  Map<String, dynamic> toJson() => _$SystemDateAndTimeToJson(this);

  DateTime get utcDateTime => utc.dateTime;

  DateTime get localDateTime => utc.dateTime;
}
