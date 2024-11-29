import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_reboot_response.g.dart';

/// This operation reboots the device.
@JsonSerializable()
class SystemRebootResponse {
  ///Posix SystemRebootResponse string.
  @JsonKey(name: 'Message', fromJson: OnvifUtil.stringMappedFromXml)
  final String message;

  SystemRebootResponse({required this.message});

  factory SystemRebootResponse.fromJson(Map<String, dynamic> json) =>
      _$SystemRebootResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SystemRebootResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
