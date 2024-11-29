// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dns_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DnsInformation _$DnsInformationFromJson(Map<String, dynamic> json) =>
    DnsInformation(
      fromDhcp: OnvifUtil.nullableBoolMappedFromXml(
          json['FromDHCP'] as Map<String, dynamic>?),
      searchDomain: DnsInformation._searchDomain(json['SearchDomain']),
      dnsFromDhcp: DnsInformation._fromJson(json['DNSFromDHCP']),
      dnsManual: DnsInformation._fromJson(json['DNSManual']),
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
