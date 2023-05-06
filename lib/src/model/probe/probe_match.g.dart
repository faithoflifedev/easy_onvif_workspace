// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'probe_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProbeMatch _$ProbeMatchFromJson(Map<String, dynamic> json) => ProbeMatch(
      endpointReference: EndpointReference.fromJson(
          json['EndpointReference'] as Map<String, dynamic>),
      types: ProbeMatch._list(json['Types']),
      scopes: ProbeMatch._list(json['Scopes']),
      xAddrs: ProbeMatch._list(json['XAddrs']),
      metadataVersion: ProbeMatch._metadata(json['MetadataVersion']),
    );

Map<String, dynamic> _$ProbeMatchToJson(ProbeMatch instance) =>
    <String, dynamic>{
      'EndpointReference': instance.endpointReference,
      'Types': instance.types,
      'Scopes': instance.scopes,
      'XAddrs': instance.xAddrs,
      'MetadataVersion': instance.metadataVersion,
    };
