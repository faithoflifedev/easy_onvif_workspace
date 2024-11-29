import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ip_address.g.dart';

/// The multicast address (if this address is set to 0 no multicast streaming is
/// enabled).
@JsonSerializable()
class IpAddress {
  /// Indicates if the address is an IPv4 or IPv6 address.
  /// - enum { 'IPv4', 'IPv6' }
  @JsonKey(name: 'Type', fromJson: OnvifUtil.stringMappedFromXml)
  final String type;

  /// IPv4 address.
  @JsonKey(name: 'IPv4Address', fromJson: OnvifUtil.nullableStringMappedFromXml)
  final String? ipv4Address;

  /// IPv6 address
  @JsonKey(name: 'IPv6Address', fromJson: OnvifUtil.nullableStringMappedFromXml)
  final String? ipv6Address;

  IpAddress({
    required this.type,
    required this.ipv4Address,
    required this.ipv6Address,
  });

  factory IpAddress.fromJson(Map<String, dynamic> json) =>
      _$IpAddressFromJson(json);

  Map<String, dynamic> toJson() => _$IpAddressToJson(this);

  @override
  String toString() => json.encode(toJson());
}
