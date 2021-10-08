// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multicast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Multicast _$MulticastFromJson(Map<String, dynamic> json) => Multicast(
      Address.fromJson(json['Address'] as Map<String, dynamic>),
      json['Port'],
      json['TTL'],
      json['AutoStart'],
    );

Map<String, dynamic> _$MulticastToJson(Multicast instance) => <String, dynamic>{
      'Address': instance.address,
      'Port': instance.xmlPort,
      'TTL': instance.xmlTtl,
      'AutoStart': instance.xmlAutoStart,
    };
