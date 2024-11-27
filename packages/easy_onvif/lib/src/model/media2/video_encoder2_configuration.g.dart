// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_encoder2_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoEncoder2Configuration _$VideoEncoder2ConfigurationFromJson(
        Map<String, dynamic> json) =>
    VideoEncoder2Configuration(
      token: json['@token'] as String,
      name: OnvifUtil.mappedToString(json['Name']),
      useCount: OnvifUtil.mappedToInt(json['UseCount'] as Map<String, dynamic>),
      govLength: int.parse(json['@GovLength'] as String),
      anchorFrameDistance: OnvifUtil.nullableMappedToInt(
          json['AnchorFrameDistance'] as Map<String, dynamic>?),
      profile: json['@Profile'] as String,
      guaranteedFrameRate: OnvifUtil.nullableMappedToBool(
          json['GuaranteedFrameRate'] as Map<String, dynamic>?),
      encoding: OnvifUtil.mappedToString(json['Encoding']),
      resolution:
          VideoResolution2.fromJson(json['Resolution'] as Map<String, dynamic>),
      rateControl: VideoRateControl2.fromJson(
          json['RateControl'] as Map<String, dynamic>),
      multicast: MulticastConfiguration.fromJson(
          json['Multicast'] as Map<String, dynamic>),
      quality:
          OnvifUtil.mappedToDouble(json['Quality'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoEncoder2ConfigurationToJson(
        VideoEncoder2Configuration instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Name': instance.name,
      'UseCount': instance.useCount,
      '@GovLength': instance.govLength,
      'AnchorFrameDistance': instance.anchorFrameDistance,
      '@Profile': instance.profile,
      'GuaranteedFrameRate': instance.guaranteedFrameRate,
      'Encoding': instance.encoding,
      'Resolution': instance.resolution,
      'RateControl': instance.rateControl,
      'Multicast': instance.multicast,
      'Quality': instance.quality,
    };
