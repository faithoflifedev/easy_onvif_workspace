// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      OnvifUtil.mappedToString(json['Type'] as Map<String, dynamic>),
      OnvifUtil.mappedToString(json['IPv4Address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'Type': instance.type,
      'IPv4Address': instance.ip4Address,
    };
