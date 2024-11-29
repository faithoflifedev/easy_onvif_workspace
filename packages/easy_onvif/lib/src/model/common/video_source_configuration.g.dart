// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_source_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoSourceConfiguration _$VideoSourceConfigurationFromJson(
        Map<String, dynamic> json) =>
    VideoSourceConfiguration(
      token: json['@token'] as String,
      name: OnvifUtil.stringMappedFromXml(json['Name'] as Map<String, dynamic>),
      useCount:
          OnvifUtil.intMappedFromXml(json['UseCount'] as Map<String, dynamic>),
      sourceToken: OnvifUtil.stringMappedFromXml(
          json['SourceToken'] as Map<String, dynamic>),
      bounds: IntRectangle.fromJson(json['Bounds'] as Map<String, dynamic>),
      extension: json['Extension'],
    );

Map<String, dynamic> _$VideoSourceConfigurationToJson(
        VideoSourceConfiguration instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Name': instance.name,
      'UseCount': instance.useCount,
      'SourceToken': instance.sourceToken,
      'Bounds': instance.bounds,
      'Extension': instance.extension,
    };
