import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'capabilities.dart';

part 'get_service_capabilities_response.g.dart';

/// Returns the capabilities of the imaging service. The result is returned in a
/// typed answer.
@JsonSerializable()
class GetServiceCapabilitiesResponse {
  /// The capabilities for the imaging service is returned in the Capabilities
  /// element.
  @JsonKey(name: 'Capabilities')
  final Capabilities capabilities;

  GetServiceCapabilitiesResponse({required this.capabilities});

  factory GetServiceCapabilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServiceCapabilitiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetServiceCapabilitiesResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
