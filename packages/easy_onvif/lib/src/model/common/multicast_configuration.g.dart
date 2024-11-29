// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multicast_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MulticastConfiguration _$MulticastConfigurationFromJson(
        Map<String, dynamic> json) =>
    MulticastConfiguration(
      ipAddress: IpAddress.fromJson(json['Address'] as Map<String, dynamic>),
      port: OnvifUtil.intMappedFromXml(json['Port'] as Map<String, dynamic>),
      ttl: OnvifUtil.intMappedFromXml(json['TTL'] as Map<String, dynamic>),
      autoStart: OnvifUtil.boolMappedFromXml(
          json['AutoStart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MulticastConfigurationToJson(
        MulticastConfiguration instance) =>
    <String, dynamic>{
      'Address': instance.ipAddress,
      'Port': instance.port,
      'TTL': instance.ttl,
      'AutoStart': instance.autoStart,
    };
