// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_source_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioSourceConfiguration _$AudioSourceConfigurationFromJson(
        Map<String, dynamic> json) =>
    AudioSourceConfiguration(
      json['Name'],
      json['UseCount'],
      json['SourceToken'],
    );

Map<String, dynamic> _$AudioSourceConfigurationToJson(
        AudioSourceConfiguration instance) =>
    <String, dynamic>{
      'Name': instance.xmlName,
      'UseCount': instance.xmlUseCount,
      'SourceToken': instance.sourceToken,
    };
