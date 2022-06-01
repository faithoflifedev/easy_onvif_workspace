// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'probe_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProbeMatch _$ProbeMatchFromJson(Map<String, dynamic> json) => ProbeMatch(
      endpointReference: EndpointReference.fromJson(
          json['EndpointReference'] as Map<String, dynamic>),
      types: ProbeMatch._toList(json['Types'] as Map<String, dynamic>),
      scopes: ProbeMatch._toList(json['Scopes'] as Map<String, dynamic>),
      xaddrs: OnvifUtil.mappedToString(json['XAddrs'] as Map<String, dynamic>),
      metadataVersion: OnvifUtil.mappedToString(
          json['MetadataVersion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProbeMatchToJson(ProbeMatch instance) =>
    <String, dynamic>{
      'EndpointReference': instance.endpointReference.toJson(),
      'Types': instance.types,
      'Scopes': instance.scopes,
      'XAddrs': instance.xaddrs,
      'MetadataVersion': instance.metadataVersion,
    };
