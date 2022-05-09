// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_service_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceServiceCapabilities _$DeviceServiceCapabilitiesFromJson(
        Map<String, dynamic> json) =>
    DeviceServiceCapabilities(
      network:
          NetworkCapabilities.fromJson(json['Network'] as Map<String, dynamic>),
      security: SecurityCapabilities.fromJson(
          json['Security'] as Map<String, dynamic>),
      system:
          SystemCapabilities.fromJson(json['System'] as Map<String, dynamic>),
      misc: json['Misc'] == null
          ? null
          : MiscCapabilities.fromJson(json['Misc'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeviceServiceCapabilitiesToJson(
        DeviceServiceCapabilities instance) =>
    <String, dynamic>{
      'Network': instance.network.toJson(),
      'Security': instance.security.toJson(),
      'System': instance.system.toJson(),
      'Misc': instance.misc?.toJson(),
    };
