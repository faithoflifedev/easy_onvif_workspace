import 'package:json_annotation/json_annotation.dart';

import 'capabilities.dart';

part 'get_capabilities_response.g.dart';

/// This method has been replaced by the more generic GetServices method. For
/// capabilities of individual services refer to the [DeviceManagement.getServiceCapabilities]
/// methods.
// @Deprecated('Use [DeviceManagement.getServiceCapabilities]')
@JsonSerializable()
class GetCapabilitiesResponse {
  /// Capability information.
  @JsonKey(name: 'Capabilities')
  final Capabilities capabilities;

  GetCapabilitiesResponse({required this.capabilities});

  factory GetCapabilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCapabilitiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCapabilitiesResponseToJson(this);
}
