// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_rate_control.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoRateControl _$VideoRateControlFromJson(Map<String, dynamic> json) =>
    VideoRateControl(
      frameRateLimit:
          OnvifUtil.mappedToInt(json['FrameRateLimit'] as Map<String, dynamic>),
      encodingInterval: OnvifUtil.mappedToInt(
          json['EncodingInterval'] as Map<String, dynamic>),
      bitrateLimit:
          OnvifUtil.mappedToInt(json['BitrateLimit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoRateControlToJson(VideoRateControl instance) =>
    <String, dynamic>{
      'FrameRateLimit': instance.frameRateLimit,
      'EncodingInterval': instance.encodingInterval,
      'BitrateLimit': instance.bitrateLimit,
    };
