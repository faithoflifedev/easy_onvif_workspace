// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_output_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioOutputConfiguration _$AudioOutputConfigurationFromJson(
        Map<String, dynamic> json) =>
    AudioOutputConfiguration(
      json['@token'] as String,
      OnvifUtil.mappedToString(json['Name'] as Map<String, dynamic>),
      OnvifUtil.mappedToInt(json['UseCount'] as Map<String, dynamic>),
      OnvifUtil.mappedToString(json['OutputToken'] as Map<String, dynamic>),
      OnvifUtil.mappedToString(json['SendPrimacy'] as Map<String, dynamic>),
      OnvifUtil.mappedToInt(json['OutputLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AudioOutputConfigurationToJson(
        AudioOutputConfiguration instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Name': instance.name,
      'UseCount': instance.useCount,
      'OutputToken': instance.outputToken,
      'SendPrimacy': instance.sendPrimacy,
      'OutputLevel': instance.outputLevel,
    };
