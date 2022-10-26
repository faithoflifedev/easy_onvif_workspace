import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_capabilities.g.dart';

///System capabilities.
@JsonSerializable()
class SystemCapabilities {
  ///Indicates support for WS Discovery resolve requests.
  @JsonKey(name: '@DiscoveryResolve', fromJson: OnvifUtil.stringToBool)
  final bool discoveryResolve;

  ///Indicates support for WS-Discovery Bye.
  @JsonKey(name: '@DiscoveryBye', fromJson: OnvifUtil.stringToBool)
  final bool discoveryBye;

  ///Indicates support for remote discovery.
  @JsonKey(name: '@RemoteDiscovery', fromJson: OnvifUtil.stringToBool)
  final bool remoteDiscovery;

  ///Indicates support for system backup through MTOM.
  @JsonKey(name: '@SystemBackup', fromJson: OnvifUtil.stringToBool)
  final bool systemBackup;

  ///Indicates support for retrieval of system logging through MTOM.
  @JsonKey(name: '@SystemLogging', fromJson: OnvifUtil.stringToBool)
  final bool systemLogging;

  ///Indicates support for firmware upgrade through MTOM.
  @JsonKey(name: '@FirmwareUpgrade', fromJson: OnvifUtil.stringToBool)
  final bool firmwareUpgrade;

  ///Indicates support for firmware upgrade through HTTP.
  @JsonKey(name: '@HttpFirmwareUpgrade', fromJson: OnvifUtil.stringToBool)
  final bool httpFirmwareUpgrade;

  ///Indicates support for system backup through HTTP.
  @JsonKey(name: '@HttpSystemBackup', fromJson: OnvifUtil.stringToBool)
  final bool httpSystemBackup;

  ///Indicates support for retrieval of system logging through HTTP.
  @JsonKey(name: '@HttpSystemLogging', fromJson: OnvifUtil.stringToBool)
  final bool httpSystemLogging;

  ///Indicates support for retrieving support information through HTTP.
  @JsonKey(name: '@HttpSupportInformation', fromJson: OnvifUtil.stringToBool)
  final bool httpSupportInformation;

  ///Indicates support for storage configuration interfaces.
  @JsonKey(name: '@StorageConfiguration', fromJson: OnvifUtil.optionalBool)
  final bool? storageConfiguration;

  ///Indicates maximum number of storage configurations supported.
  @JsonKey(name: '@MaxStorageConfigurations', fromJson: OnvifUtil.optionalInt)
  final int? maxStorageConfigurations;

  ///If present signals support for geo location. The value signals the supported number of entries.
  @JsonKey(name: '@GeoLocationEntries', fromJson: OnvifUtil.optionalInt)
  final int? geoLocationEntries;

  ///List of supported automatic GeoLocation adjustment supported by the device. Valid items are defined by tds:AutoGeoMode.
  @JsonKey(name: '@AutoGeo')
  final String? autoGeo;

  ///Enumerates the supported StorageTypes, see tds:StorageType.
  @JsonKey(name: '@StorageTypesSupported')
  final String? storageTypesSupported;

  ///Indicates no support for network discovery.
  @JsonKey(name: '@DiscoveryNotSupported', fromJson: OnvifUtil.optionalBool)
  final bool? discoveryNotSupported;

  ///Indicates no support for network configuration.
  @JsonKey(name: '@NetworkConfigNotSupported', fromJson: OnvifUtil.optionalBool)
  final bool? networkConfigNotSupported;

  ///Indicates no support for user configuration.
  @JsonKey(name: '@UserConfigNotSupported', fromJson: OnvifUtil.optionalBool)
  final bool? userConfigNotSupported;

  SystemCapabilities(
      {required this.discoveryResolve,
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
      this.autoGeo,
      this.storageTypesSupported,
      this.discoveryNotSupported,
      this.networkConfigNotSupported,
      this.userConfigNotSupported});

  factory SystemCapabilities.fromJson(Map<String, dynamic> json) =>
      _$SystemCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$SystemCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
