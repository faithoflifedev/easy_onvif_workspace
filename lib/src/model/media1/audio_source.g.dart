// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioSource _$AudioSourceFromJson(Map<String, dynamic> json) => AudioSource(
      token: json['@token'] as String,
      channels: OnvifUtil.mappedToInt(json['Channels'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AudioSourceToJson(AudioSource instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Channels': instance.channels,
    };
