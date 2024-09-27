// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefixed_ipv6_ipaddress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrefixedIpv6Address _$PrefixedIpv6AddressFromJson(Map<String, dynamic> json) =>
    PrefixedIpv6Address(
      address: json['Address'] as String,
      prefixLength: (json['PrefixLength'] as num).toInt(),
    );

Map<String, dynamic> _$PrefixedIpv6AddressToJson(
        PrefixedIpv6Address instance) =>
    <String, dynamic>{
      'PrefixLength': instance.prefixLength,
      'Address': instance.address,
    };
