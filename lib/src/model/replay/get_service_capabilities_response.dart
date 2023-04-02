import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'capabilities.dart';

part 'get_service_capabilities_response.g.dart';

/// Returns the current configuration of the replay service. This operation is
/// mandatory.
@JsonSerializable()
class GetServiceCapabilitiesResponse {
  /// The current replay configuration parameters.
  @JsonKey(name: 'ReplayConfiguration')
  final Capabilities capabilities;

  GetServiceCapabilitiesResponse({required this.capabilities});

  factory GetServiceCapabilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServiceCapabilitiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetServiceCapabilitiesResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
