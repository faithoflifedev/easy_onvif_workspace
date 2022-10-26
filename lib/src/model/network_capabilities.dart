import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_capabilities.g.dart';

///Network capabilities.
@JsonSerializable()
class NetworkCapabilities {
  ///Indicates support for IP filtering.
  @JsonKey(name: '@IPFilter', fromJson: OnvifUtil.stringToBool)
  final bool ipFilter;

  ///Indicates support for zeroconf.
  @JsonKey(name: '@ZeroConfiguration', fromJson: OnvifUtil.stringToBool)
  final bool zeroConfiguration;

  ///Indicates support for IPv6.
  @JsonKey(name: '@IPVersion6', fromJson: OnvifUtil.stringToBool)
  final bool ipVersion6;

  ///Indicates support for dynamic DNS configuration.
  @JsonKey(name: '@DynDNS', fromJson: OnvifUtil.stringToBool)
  final bool dynDNS;

  ///Indicates support for IEEE 802.11 configuration.
  @JsonKey(name: '@Dot11Configuration', fromJson: OnvifUtil.stringToBool)
  final bool dot11Configuration;

  ///Indicates the maximum number of Dot1X configurations supported by the device
  @JsonKey(name: '@Dot1XConfigurations', fromJson: int.parse)
  final int dot1xConfiguration;

  ///Indicates support for retrieval of hostname from DHCP.
  @JsonKey(name: '@HostnameFromDHCP', fromJson: OnvifUtil.stringToBool)
  final bool hostnameFromDHCP;

  ///Maximum number of NTP servers supported by the devices SetNTP command.
  @JsonKey(name: '@NTP', fromJson: int.parse)
  final int ntp;

  ///Indicates support for Stateful IPv6 DHCP.
  @JsonKey(name: '@DHCPv6', fromJson: OnvifUtil.stringToBool)
  final bool dhcpv6;

  NetworkCapabilities(
      {required this.ipFilter,
      required this.zeroConfiguration,
      required this.ipVersion6,
      required this.dynDNS,
      required this.dot11Configuration,
      required this.dot1xConfiguration,
      required this.hostnameFromDHCP,
      required this.ntp,
      required this.dhcpv6});

  factory NetworkCapabilities.fromJson(Map<String, dynamic> json) =>
      _$NetworkCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
