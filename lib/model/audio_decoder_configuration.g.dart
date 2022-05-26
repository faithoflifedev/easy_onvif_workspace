// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_decoder_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioDecoderConfiguration _$AudioDecoderConfigurationFromJson(
        Map<String, dynamic> json) =>
    AudioDecoderConfiguration(
      json['@token'] as String,
      OnvifUtil.mappedToString(json['Name'] as Map<String, dynamic>),
      OnvifUtil.mappedToInt(json['UseCount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AudioDecoderConfigurationToJson(
        AudioDecoderConfiguration instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Name': instance.name,
      'UseCount': instance.useCount,
    };
