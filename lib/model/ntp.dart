import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ntp.g.dart';

@JsonSerializable()
class Ntp {
  ///Network host type: IPv4, IPv6 or DNS.
  ///- enum { 'IPv4', 'IPv6', 'DNS' }
  @JsonKey(name: 'Type', fromJson: mappedToString)
  final String type;

  @JsonKey(name: 'IPv4Address', fromJson: nullableMappedToString)
  final String? iPv4Address;

  @JsonKey(name: 'IPv6Address', fromJson: nullableMappedToString)
  final String? iPv6Address;

  @JsonKey(name: 'DNSname', fromJson: nullableMappedToString)
  final String? dnsName;

  Ntp({required this.type, this.iPv4Address, this.iPv6Address, this.dnsName});

  factory Ntp.fromJson(Map<String, dynamic> json) => _$NtpFromJson(json);

  Map<String, dynamic> toJson() => _$NtpToJson(this);
}
