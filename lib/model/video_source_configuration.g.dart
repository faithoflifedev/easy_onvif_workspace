// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_source_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoSourceConfiguration _$VideoSourceConfigurationFromJson(
        Map<String, dynamic> json) =>
    VideoSourceConfiguration(
      json['Name'],
      json['UseCount'],
      json['SourceToken'],
      Bounds.fromJson(json['Bounds'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoSourceConfigurationToJson(
        VideoSourceConfiguration instance) =>
    <String, dynamic>{
      'Name': instance.xmlName,
      'UseCount': instance.xmlUseCount,
      'SourceToken': instance.sourceToken,
      'Bounds': instance.bounds.toJson(),
    };
