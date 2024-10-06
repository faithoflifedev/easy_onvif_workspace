// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefixed_ipv4_ipaddress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrefixedIpv4Address _$PrefixedIpv4AddressFromJson(Map<String, dynamic> json) =>
    PrefixedIpv4Address(
      address: json['Address'] as String,
      prefixLength: (json['PrefixLength'] as num).toInt(),
    );

Map<String, dynamic> _$PrefixedIpv4AddressToJson(
        PrefixedIpv4Address instance) =>
    <String, dynamic>{
      'PrefixLength': instance.prefixLength,
      'Address': instance.address,
    };
