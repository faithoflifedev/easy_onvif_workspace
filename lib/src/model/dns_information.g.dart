// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dns_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DnsInformation _$DnsInformationFromJson(Map<String, dynamic> json) =>
    DnsInformation(
      fromDhcp: OnvifUtil.nullableMappedToBool(
          json['FromDHCP'] as Map<String, dynamic>?),
      searchDomain: json['SearchDomain'] as String?,
      dnsFromDhcp: DnsInformation._dnsEntryConverter(json['DNSFromDHCP']),
      dnsManual: DnsInformation._dnsEntryConverter(json['DNSManual']),
      extension: json['extension'],
    );

Map<String, dynamic> _$DnsInformationToJson(DnsInformation instance) =>
    <String, dynamic>{
      'FromDHCP': instance.fromDhcp,
      'SearchDomain': instance.searchDomain,
      'DNSFromDHCP': instance.dnsFromDhcp?.map((e) => e.toJson()).toList(),
      'DNSManual': instance.dnsManual?.map((e) => e.toJson()).toList(),
      'extension': instance.extension,
    };
