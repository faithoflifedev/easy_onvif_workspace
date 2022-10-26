// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_capabilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServiceCapabilitiesResponse _$GetServiceCapabilitiesResponseFromJson(
        Map<String, dynamic> json) =>
    GetServiceCapabilitiesResponse(
      capabilities: DeviceServiceCapabilities.fromJson(
          json['Capabilities'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetServiceCapabilitiesResponseToJson(
        GetServiceCapabilitiesResponse instance) =>
    <String, dynamic>{
      'Capabilities': instance.capabilities.toJson(),
    };
