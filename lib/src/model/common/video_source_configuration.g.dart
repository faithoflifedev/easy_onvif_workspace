// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_source_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoSourceConfiguration _$VideoSourceConfigurationFromJson(
        Map<String, dynamic> json) =>
    VideoSourceConfiguration(
      OnvifUtil.mappedToString(json['Name'] as Map<String, dynamic>),
      OnvifUtil.mappedToInt(json['UseCount'] as Map<String, dynamic>),
      OnvifUtil.mappedToString(json['SourceToken'] as Map<String, dynamic>),
      IntRectangle.fromJson(json['Bounds'] as Map<String, dynamic>),
      json['Extension'],
    );

Map<String, dynamic> _$VideoSourceConfigurationToJson(
        VideoSourceConfiguration instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'UseCount': instance.useCount,
      'SourceToken': instance.sourceToken,
      'Bounds': instance.bounds,
      'Extension': instance.extension,
    };
