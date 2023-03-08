import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_capabilities_extension.g.dart';

@JsonSerializable()
class SystemCapabilitiesExtension {
  @JsonKey(
      name: 'HttpFirmwareUpgrade', fromJson: OnvifUtil.nullableMappedToBool)
  final bool? httpFirmwareUpgrade;

  @JsonKey(name: 'HttpSystemBackup', fromJson: OnvifUtil.nullableMappedToBool)
  final bool? httpSystemBackup;

  @JsonKey(name: 'HttpSystemLogging', fromJson: OnvifUtil.nullableMappedToBool)
  final bool? httpSystemLogging;

  @JsonKey(
      name: 'HttpSupportInformation', fromJson: OnvifUtil.nullableMappedToBool)
  final bool? httpSupportInformation;

  @JsonKey(name: 'Extension')
  final SystemCapabilitiesExtension? extension;

  SystemCapabilitiesExtension({
    this.httpFirmwareUpgrade,
    this.httpSystemBackup,
    this.httpSystemLogging,
    this.httpSupportInformation,
    this.extension,
  });

  factory SystemCapabilitiesExtension.fromJson(Map<String, dynamic> json) =>
      _$SystemCapabilitiesExtensionFromJson(json);

  Map<String, dynamic> toJson() => _$SystemCapabilitiesExtensionToJson(this);

  @override
  String toString() => json.encode(toJson());
}
