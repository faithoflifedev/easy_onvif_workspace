// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemCapabilities _$SystemCapabilitiesFromJson(Map<String, dynamic> json) =>
    SystemCapabilities(
      discoveryResolve: stringToBool(json['@DiscoveryResolve'] as String),
      discoveryBye: stringToBool(json['@DiscoveryBye'] as String),
      remoteDiscovery: stringToBool(json['@RemoteDiscovery'] as String),
      systemBackup: stringToBool(json['@SystemBackup'] as String),
      systemLogging: stringToBool(json['@SystemLogging'] as String),
      firmwareUpgrade: stringToBool(json['@FirmwareUpgrade'] as String),
      httpFirmwareUpgrade: stringToBool(json['@HttpFirmwareUpgrade'] as String),
      httpSystemBackup: stringToBool(json['@HttpSystemBackup'] as String),
      httpSystemLogging: stringToBool(json['@HttpSystemLogging'] as String),
      httpSupportInformation:
          stringToBool(json['@HttpSupportInformation'] as String),
      storageConfiguration:
          stringToBool(json['@StorageConfiguration'] as String),
      maxStorageConfigurations:
          stringToInt(json['@MaxStorageConfigurations'] as String),
      geoLocationEntries:
          nullableStringToInt(json['@GeoLocationEntries'] as String?),
      autoGeo: json['@AutoGeo'] as String?,
      storageTypesSupported: json['@StorageTypesSupported'] as String?,
      discoveryNotSupported:
          nullableStringToBool(json['@DiscoveryNotSupported'] as String?),
      networkConfigNotSupported:
          nullableStringToBool(json['@NetworkConfigNotSupported'] as String?),
      userConfigNotSupported:
          nullableStringToBool(json['@UserConfigNotSupported'] as String?),
    );

Map<String, dynamic> _$SystemCapabilitiesToJson(SystemCapabilities instance) =>
    <String, dynamic>{
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
      '@AutoGeo': instance.autoGeo,
      '@StorageTypesSupported': instance.storageTypesSupported,
      '@DiscoveryNotSupported': instance.discoveryNotSupported,
      '@NetworkConfigNotSupported': instance.networkConfigNotSupported,
      '@UserConfigNotSupported': instance.userConfigNotSupported,
    };
