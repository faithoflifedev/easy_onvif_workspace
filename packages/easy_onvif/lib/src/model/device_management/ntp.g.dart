// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ntp _$NtpFromJson(Map<String, dynamic> json) => Ntp(
      type: OnvifUtil.mappedToString(json['Type']),
      iPv4Address: OnvifUtil.nullableMappedToString(
          json['IPv4Address'] as Map<String, dynamic>?),
      iPv6Address: OnvifUtil.nullableMappedToString(
          json['IPv6Address'] as Map<String, dynamic>?),
      dnsName: OnvifUtil.nullableMappedToString(
          json['DNSname'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$NtpToJson(Ntp instance) => <String, dynamic>{
      'Type': instance.type,
      'IPv4Address': instance.iPv4Address,
      'IPv6Address': instance.iPv6Address,
      'DNSname': instance.dnsName,
    };
