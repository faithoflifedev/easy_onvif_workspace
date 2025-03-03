// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_dynamic_dns_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDynamicDnsResponse _$GetDynamicDnsResponseFromJson(
  Map<String, dynamic> json,
) => GetDynamicDnsResponse(
  DynamicDnsInformation.fromJson(
    json['DynamicDNSInformation'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetDynamicDnsResponseToJson(
  GetDynamicDnsResponse instance,
) => <String, dynamic>{'DynamicDNSInformation': instance.dynamicDnsInformation};
