// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      nameSpace: OnvifUtil.mappedToString(json['Namespace']),
      xAddr: OnvifUtil.mappedToString(json['XAddr']),
      version: Version.fromJson(json['Version'] as Map<String, dynamic>),
      capabilities: json['Capabilities'] == null
          ? null
          : Capabilities.fromJson(json['Capabilities'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'Namespace': instance.nameSpace,
      'XAddr': instance.xAddr,
      'Version': instance.version,
      'Capabilities': instance.capabilities,
    };
