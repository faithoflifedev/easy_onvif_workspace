// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

System _$SystemFromJson(Map<String, dynamic> json) => System(
      discoveryResolve: OnvifUtil.nullableMappedToBool(
          json['DiscoveryResolve'] as Map<String, dynamic>?),
      discoveryBye: OnvifUtil.nullableMappedToBool(
          json['DiscoveryBye'] as Map<String, dynamic>?),
      remoteDiscovery: OnvifUtil.nullableMappedToBool(
          json['RemoteDiscovery'] as Map<String, dynamic>?),
      systemBackup: OnvifUtil.nullableMappedToBool(
          json['SystemBackup'] as Map<String, dynamic>?),
      systemLogging: OnvifUtil.nullableMappedToBool(
          json['SystemLogging'] as Map<String, dynamic>?),
      firmwareUpgrade: OnvifUtil.nullableMappedToBool(
          json['FirmwareUpgrade'] as Map<String, dynamic>?),
      supportedVersions:
          System._supportedVersionConverter(json['SupportedVersions']),
    );

Map<String, dynamic> _$SystemToJson(System instance) => <String, dynamic>{
      'DiscoveryResolve': instance.discoveryResolve,
      'DiscoveryBye': instance.discoveryBye,
      'RemoteDiscovery': instance.remoteDiscovery,
      'SystemBackup': instance.systemBackup,
      'SystemLogging': instance.systemLogging,
      'FirmwareUpgrade': instance.firmwareUpgrade,
      'SupportedVersions':
          instance.supportedVersions.map((e) => e.toJson()).toList(),
    };
