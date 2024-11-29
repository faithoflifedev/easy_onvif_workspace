// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_analytics_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoAnalyticsConfiguration _$VideoAnalyticsConfigurationFromJson(
        Map<String, dynamic> json) =>
    VideoAnalyticsConfiguration(
      name: OnvifUtil.stringMappedFromXml(json['Name'] as Map<String, dynamic>),
      useCount:
          OnvifUtil.intMappedFromXml(json['UseCount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoAnalyticsConfigurationToJson(
        VideoAnalyticsConfiguration instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'UseCount': instance.useCount,
    };
