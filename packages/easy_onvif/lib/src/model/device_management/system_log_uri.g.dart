// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_log_uri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemLogUri _$SystemLogUriFromJson(Map<String, dynamic> json) => SystemLogUri(
      type: OnvifUtil.mappedToString(json['Type']),
      uri: OnvifUtil.nullableMappedToString(
          json['Uri'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$SystemLogUriToJson(SystemLogUri instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Uri': instance.uri,
    };
