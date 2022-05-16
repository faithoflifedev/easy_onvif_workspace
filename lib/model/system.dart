import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

import 'supported_version.dart';

part 'system.g.dart';

@JsonSerializable(explicitToJson: true)
class System {
  @JsonKey(name: 'DiscoveryResolve', fromJson: OnvifUtil.nullableMappedToBool)
  final bool? discoveryResolve;

  @JsonKey(name: 'DiscoveryBye', fromJson: OnvifUtil.nullableMappedToBool)
  final bool? discoveryBye;

  @JsonKey(name: 'RemoteDiscovery', fromJson: OnvifUtil.nullableMappedToBool)
  final bool? remoteDiscovery;

  @JsonKey(name: 'SystemBackup', fromJson: OnvifUtil.nullableMappedToBool)
  final bool? systemBackup;

  @JsonKey(name: 'SystemLogging', fromJson: OnvifUtil.nullableMappedToBool)
  final bool? systemLogging;

  @JsonKey(name: 'FirmwareUpgrade', fromJson: OnvifUtil.nullableMappedToBool)
  final bool? firmwareUpgrade;

  @JsonKey(name: 'SupportedVersions', fromJson: _supportedVersionConverter)
  final List<SupportedVersion> supportedVersions;

  System(
      {this.discoveryResolve,
      this.discoveryBye,
      this.remoteDiscovery,
      this.systemBackup,
      this.systemLogging,
      this.firmwareUpgrade,
      required this.supportedVersions});

  factory System.fromJson(Map<String, dynamic> json) => _$SystemFromJson(json);

  Map<String, dynamic> toJson() => _$SystemToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<SupportedVersion> _supportedVersionConverter(dynamic json) {
    if (json is List) {
      return json
          .map((e) => SupportedVersion.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [SupportedVersion.fromJson(json as Map<String, dynamic>)];
  }
}
