import 'dart:convert';

// import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

import 'dns_entry.dart';

part 'dns_information.g.dart';

/// DNS Information.
@JsonSerializable(explicitToJson: true)
class DnsInformation {
  /// Indicates whether or not DNS information is retrieved from DHCP.
  @JsonKey(name: 'FromDHCP', fromJson: OnvifUtil.nullableMappedToBool)
  final bool? fromDhcp;

  /// Search domain.
  @JsonKey(name: 'SearchDomain')
  final String? searchDomain;

  /// List of DNS addresses received from DHCP.
  @JsonKey(name: 'DNSFromDHCP', fromJson: _dnsEntryConverter)
  final List<DnsEntry>? dnsFromDhcp;

  /// List of manually entered DNS addresses.
  @JsonKey(name: 'DNSManual', fromJson: _dnsEntryConverter)
  final List<DnsEntry>? dnsManual;

  final dynamic extension;

  DnsInformation({
    required this.fromDhcp,
    this.searchDomain,
    this.dnsFromDhcp,
    this.dnsManual,
    this.extension,
  });

  factory DnsInformation.fromJson(Map<String, dynamic> json) =>
      _$DnsInformationFromJson(json);

  Map<String, dynamic> toJson() => _$DnsInformationToJson(this);

  static List<DnsEntry> _dnsEntryConverter(dynamic json) {
    if (json == null) {
      return [];
    }

    if (json is List) {
      return json
          .map((e) => DnsEntry.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [DnsEntry.fromJson(json as Map<String, dynamic>)];
  }

  @override
  String toString() => json.encode(toJson());
}
