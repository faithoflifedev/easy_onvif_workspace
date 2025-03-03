// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_service_capabilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServiceCapabilitiesResponse _$GetServiceCapabilitiesResponseFromJson(
  Map<String, dynamic> json,
) => GetServiceCapabilitiesResponse(
  capabilities: Capabilities.fromJson(
    json['ReplayConfiguration'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetServiceCapabilitiesResponseToJson(
  GetServiceCapabilitiesResponse instance,
) => <String, dynamic>{'ReplayConfiguration': instance.capabilities};
