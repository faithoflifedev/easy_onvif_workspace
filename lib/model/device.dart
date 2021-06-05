import 'package:json_annotation/json_annotation.dart';

import 'system.dart';

part 'device.g.dart';

@JsonSerializable(explicitToJson: true)
class Device {
  @JsonKey(name: 'XAddr')
  final dynamic xmlXAddr;

  @JsonKey(name: 'System')
  final System system;

  String get xAddr => xmlXAddr['\$'];

  Device(this.xmlXAddr, this.system);

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
