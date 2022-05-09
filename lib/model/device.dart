import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'system.dart';

part 'device.g.dart';

///Device capabilities
@JsonSerializable(explicitToJson: true)
class Device {
  @JsonKey(name: 'XAddr')
  final dynamic xmlXAddr;

  ///System capabilities.
  @JsonKey(name: 'System')
  final System system;

  ///Device service URI.
  String get xAddr => xmlXAddr['\$'];

  Device({required this.xmlXAddr, required this.system});

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
