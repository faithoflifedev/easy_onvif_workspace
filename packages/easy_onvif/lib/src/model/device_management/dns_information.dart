import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'dns_entry.dart';

part 'dns_information.g.dart';

/// DNS Information.
@JsonSerializable()
class DnsInformation {
  /// Indicates whether or not DNS information is retrieved from DHCP.
  @JsonKey(name: 'FromDHCP', fromJson: OnvifUtil.nullableBoolMappedFromXml)
  final bool? fromDhcp;

  /// Search domain.
  @JsonKey(name: 'SearchDomain', fromJson: _searchDomain)
  final List<String>? searchDomain;

  /// List of DNS addresses received from DHCP.
  @JsonKey(name: 'DNSFromDHCP', fromJson: _fromJson)
  final List<DnsEntry>? dnsFromDhcp;

  /// List of manually entered DNS addresses.
  @JsonKey(name: 'DNSManual', fromJson: _fromJson)
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

  static List<DnsEntry> _fromJson(dynamic json) => OnvifUtil.jsonList<DnsEntry>(
    json,
    (json) => DnsEntry.fromJson(json as Map<String, dynamic>),
  );

  static List<String>? _searchDomain(dynamic json) {
    if (json == null) {
      return <String>[];
    }

    if (json is List) {
      return json
          .map((e) => OnvifUtil.stringMappedFromXml(e as Map<String, dynamic>))
          .toList();
    }

    return [OnvifUtil.stringMappedFromXml(json as Map<String, dynamic>)];
  }

  @override
  String toString() => json.encode(toJson());
}
