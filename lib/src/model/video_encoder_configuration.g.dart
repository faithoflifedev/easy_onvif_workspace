// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_encoder_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoEncoderConfiguration _$VideoEncoderConfigurationFromJson(
        Map<String, dynamic> json) =>
    VideoEncoderConfiguration(
      name: OnvifUtil.mappedToString(json['Name'] as Map<String, dynamic>),
      useCount: OnvifUtil.mappedToInt(json['UseCount'] as Map<String, dynamic>),
      encoding: OnvifUtil.nullableMappedToString(
          json['Encoding'] as Map<String, dynamic>?),
      resolution: json['Resolution'] == null
          ? null
          : Resolution.fromJson(json['Resolution'] as Map<String, dynamic>),
      quality:
          OnvifUtil.mappedToDouble(json['Quality'] as Map<String, dynamic>),
      rateControl: json['RateControl'] == null
          ? null
          : RateControl.fromJson(json['RateControl'] as Map<String, dynamic>),
      mpeg4: json['MPEG4'] == null
          ? null
          : Mpeg4.fromJson(json['MPEG4'] as Map<String, dynamic>),
      h264: json['H264'] == null
          ? null
          : H264.fromJson(json['H264'] as Map<String, dynamic>),
      multiCast: Multicast.fromJson(json['Multicast'] as Map<String, dynamic>),
      sessionTimeout: OnvifUtil.mappedToString(
          json['SessionTimeout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoEncoderConfigurationToJson(
        VideoEncoderConfiguration instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'UseCount': instance.useCount,
      'Encoding': instance.encoding,
      'Resolution': instance.resolution?.toJson(),
      'Quality': instance.quality,
      'RateControl': instance.rateControl?.toJson(),
      'MPEG4': instance.mpeg4?.toJson(),
      'H264': instance.h264?.toJson(),
      'Multicast': instance.multiCast.toJson(),
      'SessionTimeout': instance.sessionTimeout,
    };
