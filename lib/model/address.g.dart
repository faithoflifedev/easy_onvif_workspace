// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['Type'],
      json['IPv4Address'],
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'Type': instance.xmlType,
      'IPv4Address': instance.xmlIp4Address,
    };
