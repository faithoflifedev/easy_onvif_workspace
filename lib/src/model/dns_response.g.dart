// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dns_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDnsResponse _$GetDnsResponseFromJson(Map<String, dynamic> json) =>
    GetDnsResponse(
      DnsInformation.fromJson(json['DNSInformation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDnsResponseToJson(GetDnsResponse instance) =>
    <String, dynamic>{
      'DNSInformation': instance.dnsInformation,
    };
