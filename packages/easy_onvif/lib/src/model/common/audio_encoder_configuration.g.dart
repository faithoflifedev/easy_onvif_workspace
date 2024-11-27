// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_encoder_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioEncoderConfiguration _$AudioEncoderConfigurationFromJson(
        Map<String, dynamic> json) =>
    AudioEncoderConfiguration(
      OnvifUtil.mappedToString(json['Name']),
      OnvifUtil.mappedToInt(json['UseCount'] as Map<String, dynamic>),
      OnvifUtil.mappedToString(json['Encoding']),
      OnvifUtil.mappedToInt(json['Bitrate'] as Map<String, dynamic>),
      OnvifUtil.mappedToInt(json['SampleRate'] as Map<String, dynamic>),
      OnvifUtil.emptyMapToNull(json['Multicast'] as Map<String, dynamic>?),
      OnvifUtil.mappedToString(json['SessionTimeout']),
    );

Map<String, dynamic> _$AudioEncoderConfigurationToJson(
        AudioEncoderConfiguration instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'UseCount': instance.useCount,
      'Encoding': instance.encodingType,
      'Bitrate': instance.bitRate,
      'SampleRate': instance.sampleRate,
      'Multicast': instance.multiCast,
      'SessionTimeout': instance.sessionTimeout,
    };
