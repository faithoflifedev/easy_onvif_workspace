// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeZone _$TimeZoneFromJson(Map<String, dynamic> json) => TimeZone(
      tz: OnvifUtil.nullableStringMappedFromXml(
          json['TZ'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$TimeZoneToJson(TimeZone instance) => <String, dynamic>{
      'TZ': instance.tz,
    };
