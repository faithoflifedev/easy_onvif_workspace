// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_rate_control.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoRateControl _$VideoRateControlFromJson(Map<String, dynamic> json) =>
    VideoRateControl(
      frameRateLimit: OnvifUtil.intMappedFromXml(
          json['FrameRateLimit'] as Map<String, dynamic>),
      encodingInterval: OnvifUtil.intMappedFromXml(
          json['EncodingInterval'] as Map<String, dynamic>),
      bitrateLimit: OnvifUtil.intMappedFromXml(
          json['BitrateLimit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoRateControlToJson(VideoRateControl instance) =>
    <String, dynamic>{
      'FrameRateLimit': instance.frameRateLimit,
      'EncodingInterval': instance.encodingInterval,
      'BitrateLimit': instance.bitrateLimit,
    };
