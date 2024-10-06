import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system.g.dart';

/// System capabilities.
@JsonSerializable()
class System {
  /// Indicates support for WS Discovery resolve requests.
  @JsonKey(name: '@DiscoveryResolve', fromJson: OnvifUtil.stringToBool)
  final bool discoveryResolve;

  /// Indicates support for WS-Discovery Bye.
  @JsonKey(name: '@DiscoveryBye', fromJson: OnvifUtil.stringToBool)
  final bool discoveryBye;

  /// Indicates support for remote discovery.
  @JsonKey(name: '@RemoteDiscovery', fromJson: OnvifUtil.stringToBool)
  final bool remoteDiscovery;

  /// Indicates support for system backup through MTOM.
  @JsonKey(name: '@SystemBackup', fromJson: OnvifUtil.stringToBool)
  final bool systemBackup;

  /// Indicates support for retrieval of system logging through MTOM.
  @JsonKey(name: '@SystemLogging', fromJson: OnvifUtil.stringToBool)
  final bool systemLogging;

  /// Indicates support for firmware upgrade through MTOM.
  @JsonKey(name: '@FirmwareUpgrade', fromJson: OnvifUtil.stringToBool)
  final bool firmwareUpgrade;

  /// Indicates support for firmware upgrade through HTTP.
  @JsonKey(name: '@HttpFirmwareUpgrade', fromJson: OnvifUtil.stringToBool)
  final bool httpFirmwareUpgrade;

  /// Indicates support for system backup through HTTP.
  @JsonKey(name: '@HttpSystemBackup', fromJson: OnvifUtil.stringToBool)
  final bool httpSystemBackup;

  /// Indicates support for retrieval of system logging through HTTP.
  @JsonKey(name: '@HttpSystemLogging', fromJson: OnvifUtil.stringToBool)
  final bool httpSystemLogging;

  /// Indicates support for retrieving support information through HTTP.
  @JsonKey(name: '@HttpSupportInformation', fromJson: OnvifUtil.stringToBool)
  final bool httpSupportInformation;

  /// Indicates support for storage configuration interfaces.
  @JsonKey(name: '@StorageConfiguration', fromJson: OnvifUtil.stringToBool)
  final bool storageConfiguration;

  /// Indicates maximum number of storage configurations supported.
  @JsonKey(name: '@MaxStorageConfigurations', fromJson: OnvifUtil.stringToBool)
  final bool maxStorageConfigurations;

  /// If present signals support for geo location. The value signals the
  /// supported number of entries.
  @JsonKey(name: '@GeoLocationEntries', fromJson: int.parse)
  final int geoLocationEntries;

  /// List of supported automatic GeoLocation adjustment supported by the
  /// device. Valid items are defined by tds:AutoGeoMode.
  @JsonKey(name: '@StorageTypesSupported', fromJson: OnvifUtil.stringToList)
  final List<String> storageTypesSupported;

  /// Indicates no support for network discovery.
  @JsonKey(name: '@DiscoveryNotSupported', fromJson: OnvifUtil.stringToBool)
  final bool discoveryNotSupported;

  /// Indicates no support for network configuration.
  @JsonKey(name: '@NetworkConfigNotSupported', fromJson: OnvifUtil.stringToBool)
  final bool networkConfigNotSupported;

  /// Indicates no support for user configuration.
  @JsonKey(name: '@UserConfigNotSupported', fromJson: OnvifUtil.stringToBool)
  final bool userConfigNotSupported;

  /// List of supported Addons by the device.
  @JsonKey(name: '@Addons', fromJson: OnvifUtil.stringToList)
  final List<String> addons;

  System({
    required this.discoveryResolve,
    required this.discoveryBye,
    required this.remoteDiscovery,
    required this.systemBackup,
    required this.systemLogging,
    required this.firmwareUpgrade,
    required this.httpFirmwareUpgrade,
    required this.httpSystemBackup,
    required this.httpSystemLogging,
    required this.httpSupportInformation,
    required this.storageConfiguration,
    required this.maxStorageConfigurations,
    required this.geoLocationEntries,
    required this.storageTypesSupported,
    required this.discoveryNotSupported,
    required this.networkConfigNotSupported,
    required this.userConfigNotSupported,
    required this.addons,
  });

  factory System.fromJson(Map<String, dynamic> json) => _$SystemFromJson(json);

  Map<String, dynamic> toJson() => _$SystemToJson(this);

  @override
  String toString() => json.encode(toJson());
}
