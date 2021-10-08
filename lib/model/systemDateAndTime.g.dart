// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'systemDateAndTime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemDateAndTime _$SystemDateAndTimeFromJson(Map<String, dynamic> json) =>
    SystemDateAndTime(
      json['DateTimeType'],
      json['DaylightSavings'],
      TimeZone.fromJson(json['TimeZone'] as Map<String, dynamic>),
      OnvifDateTime.fromJson(json['UTCDateTime'] as Map<String, dynamic>),
      OnvifDateTime.fromJson(json['LocalDateTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SystemDateAndTimeToJson(SystemDateAndTime instance) =>
    <String, dynamic>{
      'DateTimeType': instance.xmlDateTimeType,
      'DaylightSavings': instance.xmlDaylightSavings,
      'TimeZone': instance.timeZone.toJson(),
      'UTCDateTime': instance.utc.toJson(),
      'LocalDateTime': instance.local.toJson(),
    };
