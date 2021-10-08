import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'networkProtocol.dart';

part 'networkProtocolsResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetNetworkProtocolsResponse {
  @JsonKey(name: 'NetworkProtocols', fromJson: _networkProtocolConverter)
  final List<NetworkProtocol> networkProtocols;

  GetNetworkProtocolsResponse(this.networkProtocols);

  factory GetNetworkProtocolsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNetworkProtocolsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetNetworkProtocolsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<NetworkProtocol> _networkProtocolConverter(dynamic json) {
    if (json is List) {
      return json
          .map((e) => NetworkProtocol.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [NetworkProtocol.fromJson(json as Map<String, dynamic>)];
  }
}
