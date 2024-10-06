// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_capabilities_extension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemCapabilitiesExtension _$SystemCapabilitiesExtensionFromJson(
        Map<String, dynamic> json) =>
    SystemCapabilitiesExtension(
      httpFirmwareUpgrade: OnvifUtil.nullableMappedToBool(
          json['HttpFirmwareUpgrade'] as Map<String, dynamic>?),
      httpSystemBackup: OnvifUtil.nullableMappedToBool(
          json['HttpSystemBackup'] as Map<String, dynamic>?),
      httpSystemLogging: OnvifUtil.nullableMappedToBool(
          json['HttpSystemLogging'] as Map<String, dynamic>?),
      httpSupportInformation: OnvifUtil.nullableMappedToBool(
          json['HttpSupportInformation'] as Map<String, dynamic>?),
      extension: json['Extension'] == null
          ? null
          : SystemCapabilitiesExtension.fromJson(
              json['Extension'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SystemCapabilitiesExtensionToJson(
        SystemCapabilitiesExtension instance) =>
    <String, dynamic>{
      'HttpFirmwareUpgrade': instance.httpFirmwareUpgrade,
      'HttpSystemBackup': instance.httpSystemBackup,
      'HttpSystemLogging': instance.httpSystemLogging,
      'HttpSupportInformation': instance.httpSupportInformation,
      'Extension': instance.extension,
    };
