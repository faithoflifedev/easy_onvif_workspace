// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

System _$SystemFromJson(Map<String, dynamic> json) => System(
      xmlDiscoveryResolve: json['DiscoveryResolve'],
      xmlDiscoveryBye: json['DiscoveryBye'],
      xmlRemoteDiscovery: json['RemoteDiscovery'],
      xmlSystemBackup: json['SystemBackup'],
      xmlSystemLogging: json['SystemLogging'],
      xmlFirmwareUpgrade: json['FirmwareUpgrade'],
      supportedVersions:
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
