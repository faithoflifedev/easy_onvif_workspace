// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_rate_control2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoRateControl2 _$VideoRateControl2FromJson(Map<String, dynamic> json) =>
    VideoRateControl2(
      constantBitRate: bool.parse(json['@ConstantBitRate'] as String),
      frameRateLimit: OnvifUtil.doubleMappedFromXml(
          json['FrameRateLimit'] as Map<String, dynamic>),
      bitrateLimit: OnvifUtil.intMappedFromXml(
          json['BitrateLimit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoRateControl2ToJson(VideoRateControl2 instance) =>
    <String, dynamic>{
      '@ConstantBitRate': instance.constantBitRate,
      'FrameRateLimit': instance.frameRateLimit,
      'BitrateLimit': instance.bitrateLimit,
    };
