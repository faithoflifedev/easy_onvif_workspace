// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_encoder_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioEncoderConfiguration _$AudioEncoderConfigurationFromJson(
        Map<String, dynamic> json) =>
    AudioEncoderConfiguration(
      OnvifUtil.mappedToString(json['Name'] as Map<String, dynamic>),
      OnvifUtil.mappedToInt(json['UseCount'] as Map<String, dynamic>),
      OnvifUtil.mappedToString(json['Encoding'] as Map<String, dynamic>),
      OnvifUtil.mappedToInt(json['Bitrate'] as Map<String, dynamic>),
      OnvifUtil.mappedToInt(json['SampleRate'] as Map<String, dynamic>),
      Multicast.fromJson(json['Multicast'] as Map<String, dynamic>),
      OnvifUtil.mappedToString(json['SessionTimeout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AudioEncoderConfigurationToJson(
        AudioEncoderConfiguration instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'UseCount': instance.useCount,
      'Encoding': instance.encodingType,
      'Bitrate': instance.bitRate,
      'SampleRate': instance.sampleRate,
      'Multicast': instance.multiCast.toJson(),
      'SessionTimeout': instance.sessionTimeout,
    };
