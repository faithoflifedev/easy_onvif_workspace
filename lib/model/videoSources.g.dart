// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoSources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoSources _$VideoSourcesFromJson(Map<String, dynamic> json) => VideoSources(
      token: json['@token'] as String,
      xmlFrameRate: json['Framerate'],
      resolution:
          Resolution.fromJson(json['Resolution'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoSourcesToJson(VideoSources instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Framerate': instance.xmlFrameRate,
      'Resolution': instance.resolution.toJson(),
    };
