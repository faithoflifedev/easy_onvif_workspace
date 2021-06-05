import 'package:json_annotation/json_annotation.dart';

import 'networkProtocol.dart';

part 'networkProtocolsResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetNetworkProtocolsResponse {
  @JsonKey(name: 'NetworkProtocols')
  final List<NetworkProtocol> networkProtocols;

  GetNetworkProtocolsResponse(this.networkProtocols);

  factory GetNetworkProtocolsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNetworkProtocolsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetNetworkProtocolsResponseToJson(this);
}
