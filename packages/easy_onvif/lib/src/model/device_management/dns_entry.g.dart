// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dns_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DnsEntry _$DnsEntryFromJson(Map<String, dynamic> json) => DnsEntry(
  type: OnvifUtil.stringMappedFromXml(json['Type'] as Map<String, dynamic>),
  ipv4Address: OnvifUtil.nullableStringMappedFromXml(
    json['IPv4Address'] as Map<String, dynamic>?,
  ),
  ipv6Address: OnvifUtil.nullableStringMappedFromXml(
    json['IPv6Address'] as Map<String, dynamic>?,
  ),
);

Map<String, dynamic> _$DnsEntryToJson(DnsEntry instance) => <String, dynamic>{
  'Type': instance.type,
  'IPv4Address': instance.ipv4Address,
  'IPv6Address': instance.ipv6Address,
};
