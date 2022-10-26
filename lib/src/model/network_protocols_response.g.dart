// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_protocols_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNetworkProtocolsResponse _$GetNetworkProtocolsResponseFromJson(
        Map<String, dynamic> json) =>
    GetNetworkProtocolsResponse(
      GetNetworkProtocolsResponse._networkProtocolConverter(
          json['NetworkProtocols']),
    );

Map<String, dynamic> _$GetNetworkProtocolsResponseToJson(
        GetNetworkProtocolsResponse instance) =>
    <String, dynamic>{
      'NetworkProtocols':
          instance.networkProtocols.map((e) => e.toJson()).toList(),
    };
