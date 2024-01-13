import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'device_service_capabilities.dart';
import 'io_capabilities.dart';
import 'network_capabilities.dart';
import 'security_capabilities.dart';
import 'system_capabilities.dart';

part 'device_capabilities.g.dart';

/// Device capabilities
@JsonSerializable()
class DeviceCapabilities extends DeviceServiceCapabilities {
  /// Device service URI.
  @JsonKey(name: 'XAddr', fromJson: OnvifUtil.mappedToString)
  final String xAddr;

  DeviceCapabilities({
    required this.xAddr,
    super.network,
    super.system,
    super.io,
    super.security,
    super.extension,
  });

  factory DeviceCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DeviceCapabilitiesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeviceCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
