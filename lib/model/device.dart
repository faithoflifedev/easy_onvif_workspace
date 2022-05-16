import 'dart:convert';

import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'system.dart';

part 'device.g.dart';

///Device capabilities
@JsonSerializable(explicitToJson: true)
class Device {
  ///Device service URI.
  @JsonKey(name: 'XAddr', fromJson: OnvifUtil.mappedToString)
  final dynamic xAddr;

  ///System capabilities.
  @JsonKey(name: 'System')
  final System system;

  Device({required this.xAddr, required this.system});

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
