import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'misc_capabilities.dart';
import 'network_capabilities.dart';
import 'security_capabilities.dart';
import 'system_capabilities.dart';

part 'device_service_capabilities.g.dart';

///The capabilities for the device service is returned in the Capabilities element.
@JsonSerializable(explicitToJson: true)
class DeviceServiceCapabilities {
  //Network capabilities.
  @JsonKey(name: 'Network')
  NetworkCapabilities network;

  ///Security capabilities.
  @JsonKey(name: 'Security')
  SecurityCapabilities security;

  ///System capabilities.
  @JsonKey(name: 'System')
  SystemCapabilities system;

  ///Capabilities that do not fit in any of the other categories.
  @JsonKey(name: 'Misc')
  MiscCapabilities? misc;

  DeviceServiceCapabilities(
      {required this.network,
      required this.security,
      required this.system,
      required this.misc});

  factory DeviceServiceCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DeviceServiceCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceServiceCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
