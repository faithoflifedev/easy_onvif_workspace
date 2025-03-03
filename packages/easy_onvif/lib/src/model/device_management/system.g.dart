// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

System _$SystemFromJson(Map<String, dynamic> json) => System(
  discoveryResolve: OnvifUtil.stringToBool(json['@DiscoveryResolve'] as String),
  discoveryBye: OnvifUtil.stringToBool(json['@DiscoveryBye'] as String),
  remoteDiscovery: OnvifUtil.stringToBool(json['@RemoteDiscovery'] as String),
  systemBackup: OnvifUtil.stringToBool(json['@SystemBackup'] as String),
  systemLogging: OnvifUtil.stringToBool(json['@SystemLogging'] as String),
  firmwareUpgrade: OnvifUtil.stringToBool(json['@FirmwareUpgrade'] as String),
  httpFirmwareUpgrade: OnvifUtil.stringToBool(
    json['@HttpFirmwareUpgrade'] as String,
  ),
  httpSystemBackup: OnvifUtil.stringToBool(json['@HttpSystemBackup'] as String),
  httpSystemLogging: OnvifUtil.stringToBool(
    json['@HttpSystemLogging'] as String,
  ),
  httpSupportInformation: OnvifUtil.stringToBool(
    json['@HttpSupportInformation'] as String,
  ),
  storageConfiguration: OnvifUtil.stringToBool(
    json['@StorageConfiguration'] as String,
  ),
  maxStorageConfigurations: OnvifUtil.stringToBool(
    json['@MaxStorageConfigurations'] as String,
  ),
  geoLocationEntries: int.parse(json['@GeoLocationEntries'] as String),
  storageTypesSupported: OnvifUtil.stringToList(
    json['@StorageTypesSupported'] as String,
  ),
  discoveryNotSupported: OnvifUtil.stringToBool(
    json['@DiscoveryNotSupported'] as String,
  ),
  networkConfigNotSupported: OnvifUtil.stringToBool(
    json['@NetworkConfigNotSupported'] as String,
  ),
  userConfigNotSupported: OnvifUtil.stringToBool(
    json['@UserConfigNotSupported'] as String,
  ),
  addons: OnvifUtil.stringToList(json['@Addons'] as String),
);

Map<String, dynamic> _$SystemToJson(System instance) => <String, dynamic>{
  '@DiscoveryResolve': instance.discoveryResolve,
  '@DiscoveryBye': instance.discoveryBye,
  '@RemoteDiscovery': instance.remoteDiscovery,
  '@SystemBackup': instance.systemBackup,
  '@SystemLogging': instance.systemLogging,
  '@FirmwareUpgrade': instance.firmwareUpgrade,
  '@HttpFirmwareUpgrade': instance.httpFirmwareUpgrade,
  '@HttpSystemBackup': instance.httpSystemBackup,
  '@HttpSystemLogging': instance.httpSystemLogging,
  '@HttpSupportInformation': instance.httpSupportInformation,
  '@StorageConfiguration': instance.storageConfiguration,
  '@MaxStorageConfigurations': instance.maxStorageConfigurations,
  '@GeoLocationEntries': instance.geoLocationEntries,
  '@StorageTypesSupported': instance.storageTypesSupported,
  '@DiscoveryNotSupported': instance.discoveryNotSupported,
  '@NetworkConfigNotSupported': instance.networkConfigNotSupported,
  '@UserConfigNotSupported': instance.userConfigNotSupported,
  '@Addons': instance.addons,
};
