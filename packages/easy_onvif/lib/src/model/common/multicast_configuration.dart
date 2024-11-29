import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ip_address.dart';

part 'multicast_configuration.g.dart';

@JsonSerializable()
class MulticastConfiguration {
  @JsonKey(name: 'Address')
  final IpAddress ipAddress;

  @JsonKey(name: 'Port', fromJson: OnvifUtil.intMappedFromXml)
  final int port;

  @JsonKey(name: 'TTL', fromJson: OnvifUtil.intMappedFromXml)
  final int ttl;

  @JsonKey(name: 'AutoStart', fromJson: OnvifUtil.boolMappedFromXml)
  final bool autoStart;

  MulticastConfiguration({
    required this.ipAddress,
    required this.port,
    required this.ttl,
    required this.autoStart,
  });

  factory MulticastConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MulticastConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$MulticastConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
