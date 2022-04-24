// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'probe_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProbeMatch _$ProbeMatchFromJson(Map<String, dynamic> json) => ProbeMatch(
      EndpointReference.fromJson(
          json['EndpointReference'] as Map<String, dynamic>),
      json['Types'],
      json['Scopes'] as String,
      json['XAddrs'],
      json['MetadataVersion'],
    );

Map<String, dynamic> _$ProbeMatchToJson(ProbeMatch instance) =>
    <String, dynamic>{
      'EndpointReference': instance.endpointReference.toJson(),
      'Types': instance.xmlTypes,
      'Scopes': instance.xmlScopes,
      'XAddrs': instance.xmlXaddrs,
      'MetadataVersion': instance.xmlMetadataVersion,
    };
