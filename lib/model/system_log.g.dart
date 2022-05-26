// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemLog _$SystemLogFromJson(Map<String, dynamic> json) => SystemLog(
      type: OnvifUtil.mappedToString(json['Type'] as Map<String, dynamic>),
      uri: OnvifUtil.nullableMappedToString(
          json['Uri'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$SystemLogToJson(SystemLog instance) => <String, dynamic>{
      'Type': instance.type,
      'Uri': instance.uri,
    };
