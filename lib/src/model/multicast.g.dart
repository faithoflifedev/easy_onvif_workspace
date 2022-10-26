// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multicast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Multicast _$MulticastFromJson(Map<String, dynamic> json) => Multicast(
      address: Address.fromJson(json['Address'] as Map<String, dynamic>),
      port: OnvifUtil.mappedToInt(json['Port'] as Map<String, dynamic>),
      ttl: OnvifUtil.mappedToInt(json['TTL'] as Map<String, dynamic>),
      autoStart:
          OnvifUtil.mappedToBool(json['AutoStart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MulticastToJson(Multicast instance) => <String, dynamic>{
      'Address': instance.address,
      'Port': instance.port,
      'TTL': instance.ttl,
      'AutoStart': instance.autoStart,
    };
