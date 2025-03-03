// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_dns_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicDnsInformation _$DynamicDnsInformationFromJson(
  Map<String, dynamic> json,
) => DynamicDnsInformation(
  type: $enumDecode(_$DynamicDnsTypeEnumMap, json['Type']),
  name: json['Name'] as String?,
  ttl: json['TTL'] as String?,
  extension: json['extension'],
);

Map<String, dynamic> _$DynamicDnsInformationToJson(
  DynamicDnsInformation instance,
) => <String, dynamic>{
  'Type': _$DynamicDnsTypeEnumMap[instance.type]!,
  'Name': instance.name,
  'TTL': instance.ttl,
  'extension': instance.extension,
};

const _$DynamicDnsTypeEnumMap = {
  DynamicDnsType.noUpdate: 'NoUpdate',
  DynamicDnsType.clientUpdates: 'ClientUpdates',
  DynamicDnsType.serverUpdates: 'ServerUpdates',
};
