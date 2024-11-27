// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      token: json['@token'] as String,
      fixed: OnvifUtil.stringToBool(json['@fixed'] as String),
      name: OnvifUtil.mappedToString(json['Name']),
      videoSourceConfiguration: json['VideoSourceConfiguration'] == null
          ? null
          : VideoSourceConfiguration.fromJson(
              json['VideoSourceConfiguration'] as Map<String, dynamic>),
      audioSourceConfiguration: json['AudioSourceConfiguration'] == null
          ? null
          : AudioSourceConfiguration.fromJson(
              json['AudioSourceConfiguration'] as Map<String, dynamic>),
      videoEncoderConfiguration: json['VideoEncoderConfiguration'] == null
          ? null
          : VideoEncoderConfiguration.fromJson(
              json['VideoEncoderConfiguration'] as Map<String, dynamic>),
      audioEncoderConfiguration: json['AudioEncoderConfiguration'] == null
          ? null
          : AudioEncoderConfiguration.fromJson(
              json['AudioEncoderConfiguration'] as Map<String, dynamic>),
      videoAnalyticsConfiguration: json['VideoAnalyticsConfiguration'] == null
          ? null
          : VideoAnalyticsConfiguration.fromJson(
              json['VideoAnalyticsConfiguration'] as Map<String, dynamic>),
      ptzConfiguration: json['PTZConfiguration'] == null
          ? null
          : PtzConfiguration.fromJson(
              json['PTZConfiguration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      '@token': instance.token,
      '@fixed': instance.fixed,
      'Name': instance.name,
      'VideoSourceConfiguration': instance.videoSourceConfiguration,
      'AudioSourceConfiguration': instance.audioSourceConfiguration,
      'VideoEncoderConfiguration': instance.videoEncoderConfiguration,
      'AudioEncoderConfiguration': instance.audioEncoderConfiguration,
      'VideoAnalyticsConfiguration': instance.videoAnalyticsConfiguration,
      'PTZConfiguration': instance.ptzConfiguration,
    };
