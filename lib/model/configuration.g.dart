// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) =>
    Configuration(
      token: json['@token'] as String,
      name: mappedToString(json['Name'] as Map<String, dynamic>),
      useCount: mappedToInt(json['UseCount'] as Map<String, dynamic>),
      compressionType: json['CompressionType'] as String?,
      geoLocation: json['GeoLocation'] as bool?,
      shapePolygon: json['ShapePolygon'] as bool?,
      ptzStatus: json['PTZStatus'] == null
          ? null
          : PtzFilter.fromJson(json['PTZStatus'] as Map<String, dynamic>),
      events: (json['Events'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      analytics: mappedToBool(json['Analytics'] as Map<String, dynamic>),
      multicast: json['Multicast'] == null
          ? null
          : Multicast.fromJson(json['Multicast'] as Map<String, dynamic>),
      sessionTimeout:
          mappedToString(json['SessionTimeout'] as Map<String, dynamic>),
      analyticsEngineConfiguration: json['AnalyticsEngineConfiguration'],
    );

Map<String, dynamic> _$ConfigurationToJson(Configuration instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Name': instance.name,
      'UseCount': instance.useCount,
      'CompressionType': instance.compressionType,
      'GeoLocation': instance.geoLocation,
      'ShapePolygon': instance.shapePolygon,
      'PTZStatus': instance.ptzStatus?.toJson(),
      'Events': instance.events?.map((e) => e.toJson()).toList(),
      'Analytics': instance.analytics,
      'Multicast': instance.multicast?.toJson(),
      'SessionTimeout': instance.sessionTimeout,
      'AnalyticsEngineConfiguration': instance.analyticsEngineConfiguration,
    };
