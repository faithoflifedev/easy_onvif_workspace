import 'package:json_annotation/json_annotation.dart';

part 'ntp.g.dart';

@JsonSerializable()
class Ntp {
  @JsonKey(name: 'Type')
  final String type;

  @JsonKey(name: 'IPv4Address')
  final String? iPv4Address;

  @JsonKey(name: 'IPv6Address')
  final String? iPv6Address;

  @JsonKey(name: 'DNSname')
  final String? dnsName;

  Ntp({required this.type, this.iPv4Address, this.iPv6Address, this.dnsName});

  factory Ntp.fromJson(Map<String, dynamic> json) => _$NtpFromJson(json);

  Map<String, dynamic> toJson() => _$NtpToJson(this);
}
