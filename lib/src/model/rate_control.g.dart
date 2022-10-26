// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_control.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateControl _$RateControlFromJson(Map<String, dynamic> json) => RateControl(
      frameRateLimit:
          OnvifUtil.mappedToInt(json['FrameRateLimit'] as Map<String, dynamic>),
      encodingInterval: OnvifUtil.mappedToInt(
          json['EncodingInterval'] as Map<String, dynamic>),
      bitrateLimit:
          OnvifUtil.mappedToInt(json['BitrateLimit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RateControlToJson(RateControl instance) =>
    <String, dynamic>{
      'FrameRateLimit': instance.frameRateLimit,
      'EncodingInterval': instance.encodingInterval,
      'BitrateLimit': instance.bitrateLimit,
    };
