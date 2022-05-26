// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemCapabilities _$SystemCapabilitiesFromJson(Map<String, dynamic> json) =>
    SystemCapabilities(
      discoveryResolve:
          OnvifUtil.stringToBool(json['@DiscoveryResolve'] as String),
      discoveryBye: OnvifUtil.stringToBool(json['@DiscoveryBye'] as String),
      remoteDiscovery:
          OnvifUtil.stringToBool(json['@RemoteDiscovery'] as String),
      systemBackup: OnvifUtil.stringToBool(json['@SystemBackup'] as String),
      systemLogging: OnvifUtil.stringToBool(json['@SystemLogging'] as String),
      firmwareUpgrade:
          OnvifUtil.stringToBool(json['@FirmwareUpgrade'] as String),
      httpFirmwareUpgrade:
          OnvifUtil.stringToBool(json['@HttpFirmwareUpgrade'] as String),
      httpSystemBackup:
          OnvifUtil.stringToBool(json['@HttpSystemBackup'] as String),
      httpSystemLogging:
          OnvifUtil.stringToBool(json['@HttpSystemLogging'] as String),
      httpSupportInformation:
          OnvifUtil.stringToBool(json['@HttpSupportInformation'] as String),
      storageConfiguration:
          OnvifUtil.optionalBool(json['@StorageConfiguration'] as String?),
      maxStorageConfigurations:
          OnvifUtil.optionalInt(json['@MaxStorageConfigurations'] as String?),
      geoLocationEntries:
          OnvifUtil.optionalInt(json['@GeoLocationEntries'] as String?),
      autoGeo: json['@AutoGeo'] as String?,
      storageTypesSupported: json['@StorageTypesSupported'] as String?,
      discoveryNotSupported:
          OnvifUtil.optionalBool(json['@DiscoveryNotSupported'] as String?),
      networkConfigNotSupported:
          OnvifUtil.optionalBool(json['@NetworkConfigNotSupported'] as String?),
      userConfigNotSupported:
          OnvifUtil.optionalBool(json['@UserConfigNotSupported'] as String?),
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
