// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioSource _$AudioSourceFromJson(Map<String, dynamic> json) => AudioSource(
      json['@token'] as String,
      json['Channels'],
    );

Map<String, dynamic> _$AudioSourceToJson(AudioSource instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Channels': instance.mapChannels,
    };
