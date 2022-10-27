import 'package:json_annotation/json_annotation.dart';

import 'dns_information.dart';

part 'dns_response.g.dart';

/// This operation gets the discovery mode of a device. See Section 7.2 for the definition of the different device discovery modes. The device shall support retrieval of the discovery mode setting through the GetDnsInformation command.
@JsonSerializable()
class GetDnsResponse {
  ///Capability information.
  @JsonKey(name: 'DNSInformation')
  final DnsInformation dnsInformation;

  GetDnsResponse(this.dnsInformation);

  factory GetDnsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDnsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDnsResponseToJson(this);
}
