import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'extension.dart';

part 'network_capabilities.g.dart';

/// Network capabilities.
@JsonSerializable()
class NetworkCapabilities {
  /// Indicates support for IP filtering.
  @JsonKey(name: 'IPFilter', fromJson: OnvifUtil.nullableBoolMappedFromXml)
  final bool? ipFilter;

  /// Indicates support for zeroConf.
  @JsonKey(
      name: 'ZeroConfiguration', fromJson: OnvifUtil.nullableBoolMappedFromXml)
  final bool? zeroConfiguration;

  /// Indicates support for IPv6.
  @JsonKey(name: 'IPVersion6', fromJson: OnvifUtil.nullableBoolMappedFromXml)
  final bool? ipVersion6;

  /// Indicates support for dynamic DNS configuration.
  @JsonKey(name: 'DynDNS', fromJson: OnvifUtil.nullableBoolMappedFromXml)
  final bool? dynDNS;

  @JsonKey(name: 'Extension')
  final Extension? extension;

  NetworkCapabilities({
    this.ipFilter,
    this.zeroConfiguration,
    this.ipVersion6,
    this.dynDNS,
    this.extension,
  });

  factory NetworkCapabilities.fromJson(Map<String, dynamic> json) =>
      _$NetworkCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
