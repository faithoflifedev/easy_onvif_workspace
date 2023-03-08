// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dns_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DnsInformation _$DnsInformationFromJson(Map<String, dynamic> json) =>
    DnsInformation(
      fromDhcp: OnvifUtil.nullableMappedToBool(
          json['FromDHCP'] as Map<String, dynamic>?),
      searchDomain: DnsInformation._unboundSearchDomain(json['SearchDomain']),
      dnsFromDhcp: DnsInformation._unbound(json['DNSFromDHCP']),
      dnsManual: DnsInformation._unbound(json['DNSManual']),
      extension: json['extension'],
    );

Map<String, dynamic> _$DnsInformationToJson(DnsInformation instance) =>
    <String, dynamic>{
      'FromDHCP': instance.fromDhcp,
      'SearchDomain': instance.searchDomain,
      'DNSFromDHCP': instance.dnsFromDhcp,
      'DNSManual': instance.dnsManual,
      'extension': instance.extension,
    };
