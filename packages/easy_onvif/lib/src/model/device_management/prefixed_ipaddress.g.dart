// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefixed_ipaddress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrefixedIpAddress _$PrefixedIpAddressFromJson(Map<String, dynamic> json) =>
    PrefixedIpAddress(
      prefixLength: (json['PrefixLength'] as num).toInt(),
    );

Map<String, dynamic> _$PrefixedIpAddressToJson(PrefixedIpAddress instance) =>
    <String, dynamic>{
      'PrefixLength': instance.prefixLength,
    };
