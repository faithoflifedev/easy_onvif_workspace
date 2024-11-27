// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_source_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioSourceConfiguration _$AudioSourceConfigurationFromJson(
        Map<String, dynamic> json) =>
    AudioSourceConfiguration(
      name: OnvifUtil.mappedToString(json['Name']),
      useCount: OnvifUtil.mappedToInt(json['UseCount'] as Map<String, dynamic>),
      sourceToken: OnvifUtil.mappedToString(json['SourceToken']),
    );

Map<String, dynamic> _$AudioSourceConfigurationToJson(
        AudioSourceConfiguration instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'UseCount': instance.useCount,
      'SourceToken': instance.sourceToken,
    };
