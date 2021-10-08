// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

System _$SystemFromJson(Map<String, dynamic> json) => System(
      json['DiscoveryResolve'],
      json['DiscoveryBye'],
      json['RemoteDiscovery'],
      json['SystemBackup'],
      json['SystemLogging'],
      json['FirmwareUpgrade'],
      System._supportedVersionConverter(json['SupportedVersions']),
    );

Map<String, dynamic> _$SystemToJson(System instance) => <String, dynamic>{
      'DiscoveryResolve': instance.xmlDiscoveryResolve,
      'DiscoveryBye': instance.xmlDiscoveryBye,
      'RemoteDiscovery': instance.xmlRemoteDiscovery,
      'SystemBackup': instance.xmlSystemBackup,
      'SystemLogging': instance.xmlSystemLogging,
      'FirmwareUpgrade': instance.xmlFirmwareUpgrade,
      'SupportedVersions':
          instance.supportedVersions.map((e) => e.toJson()).toList(),
    };
