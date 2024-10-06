import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'io_capabilities.dart';
import 'network_capabilities.dart';
import 'security_capabilities.dart';
import 'system_capabilities.dart';

part 'device_service_capabilities.g.dart';

/// Device capabilities
@JsonSerializable()
class DeviceServiceCapabilities {
  /// Network capabilities.
  @JsonKey(name: 'Network')
  NetworkCapabilities? network;

  /// System capabilities.
  @JsonKey(name: 'System')
  SystemCapabilities? system;

  /// I/O capabilities.
  @JsonKey(name: 'IO')
  IoCapabilities? io;

  /// Security capabilities.
  @JsonKey(name: 'Security')
  SecurityCapabilities? security;

  @JsonKey(name: 'Extension')
  Map<String, dynamic>? extension;

  DeviceServiceCapabilities({
    this.network,
    this.system,
    this.io,
    this.security,
    this.extension,
  });

  factory DeviceServiceCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DeviceServiceCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceServiceCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
