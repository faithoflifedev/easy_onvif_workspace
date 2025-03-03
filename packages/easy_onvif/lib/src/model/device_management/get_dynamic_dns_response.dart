import 'package:easy_onvif/device_management.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_dynamic_dns_response.g.dart';

/// This operation gets the discovery mode of a device. See Section 7.2 for the definition of the different device discovery modes. The device shall support retrieval of the discovery mode setting through the GetDiscoveryMode command.
@JsonSerializable()
class GetDynamicDnsResponse {
  /// Capability information.
  @JsonKey(name: 'DynamicDNSInformation')
  final DynamicDnsInformation dynamicDnsInformation;

  GetDynamicDnsResponse(this.dynamicDnsInformation);

  factory GetDynamicDnsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDynamicDnsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDynamicDnsResponseToJson(this);
}
