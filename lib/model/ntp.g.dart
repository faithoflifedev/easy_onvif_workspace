// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ntp _$NtpFromJson(Map<String, dynamic> json) => Ntp(
      type: json['Type'] as String,
      iPv4Address: json['IPv4Address'] as String?,
      iPv6Address: json['IPv6Address'] as String?,
      dnsName: json['DNSname'] as String?,
    );

Map<String, dynamic> _$NtpToJson(Ntp instance) => <String, dynamic>{
      'Type': instance.type,
      'IPv4Address': instance.iPv4Address,
      'IPv6Address': instance.iPv6Address,
      'DNSname': instance.dnsName,
    };
