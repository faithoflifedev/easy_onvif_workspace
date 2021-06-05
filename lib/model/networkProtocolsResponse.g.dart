// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'networkProtocolsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNetworkProtocolsResponse _$GetNetworkProtocolsResponseFromJson(
    Map<String, dynamic> json) {
  return GetNetworkProtocolsResponse(
    (json['NetworkProtocols'] as List<dynamic>)
        .map((e) => NetworkProtocol.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GetNetworkProtocolsResponseToJson(
        GetNetworkProtocolsResponse instance) =>
    <String, dynamic>{
      'NetworkProtocols':
          instance.networkProtocols.map((e) => e.toJson()).toList(),
    };
