// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_discovery_mode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDiscoveryModeResponse _$GetDiscoveryModeResponseFromJson(
        Map<String, dynamic> json) =>
    GetDiscoveryModeResponse(
      OnvifUtil.mappedToString(json['DiscoveryMode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDiscoveryModeResponseToJson(
        GetDiscoveryModeResponse instance) =>
    <String, dynamic>{
      'DiscoveryMode': instance.discoveryMode,
    };
