import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'supportedVersion.dart';

part 'system.g.dart';

@JsonSerializable(explicitToJson: true)
class System {
  @JsonKey(name: 'DiscoveryResolve')
  final dynamic xmlDiscoveryResolve;

  @JsonKey(name: 'DiscoveryBye')
  final dynamic xmlDiscoveryBye;

  @JsonKey(name: 'RemoteDiscovery')
  final dynamic xmlRemoteDiscovery;

  @JsonKey(name: 'SystemBackup')
  final dynamic xmlSystemBackup;

  @JsonKey(name: 'SystemLogging')
  final dynamic xmlSystemLogging;

  @JsonKey(name: 'FirmwareUpgrade')
  final dynamic xmlFirmwareUpgrade;

  @JsonKey(name: 'SupportedVersions', fromJson: _supportedVersionConverter)
  final List<SupportedVersion> supportedVersions;

  bool get discoveryResolve =>
      xmlDiscoveryResolve['\$'].toLowerCase() == 'true';

  bool get discoveryBye => xmlDiscoveryBye['\$'].toLowerCase() == 'true';

  bool get remoteDiscovery => xmlRemoteDiscovery['\$'].toLowerCase() == 'true';

  bool get systemBackup => xmlSystemBackup['\$'].toLowerCase() == 'true';

  bool get systemLogging => xmlSystemLogging['\$'].toLowerCase() == 'true';

  bool get firmwareUpgrade => xmlFirmwareUpgrade['\$'].toLowerCase() == 'true';

  System(
      this.xmlDiscoveryResolve,
      this.xmlDiscoveryBye,
      this.xmlRemoteDiscovery,
      this.xmlSystemBackup,
      this.xmlSystemLogging,
      this.xmlFirmwareUpgrade,
      this.supportedVersions);

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
