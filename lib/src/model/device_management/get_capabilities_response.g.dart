// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_capabilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCapabilitiesResponse _$GetCapabilitiesResponseFromJson(
        Map<String, dynamic> json) =>
    GetCapabilitiesResponse(
      capabilities:
          Capabilities.fromJson(json['Capabilities'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCapabilitiesResponseToJson(
        GetCapabilitiesResponse instance) =>
    <String, dynamic>{
      'Capabilities': instance.capabilities,
    };
