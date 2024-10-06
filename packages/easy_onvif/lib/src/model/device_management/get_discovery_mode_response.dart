import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_discovery_mode_response.g.dart';

/// This operation gets the discovery mode of a device. See Section 7.2 for the definition of the different device discovery modes. The device shall support retrieval of the discovery mode setting through the GetDiscoveryMode command.
@JsonSerializable()
class GetDiscoveryModeResponse {
  /// Capability information.
  @JsonKey(name: 'DiscoveryMode', fromJson: OnvifUtil.mappedToString)
  final String discoveryMode;

  GetDiscoveryModeResponse(this.discoveryMode);

  factory GetDiscoveryModeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDiscoveryModeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDiscoveryModeResponseToJson(this);
}
