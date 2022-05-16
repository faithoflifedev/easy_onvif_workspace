// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supported_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportedVersion _$SupportedVersionFromJson(Map<String, dynamic> json) =>
    SupportedVersion(
      OnvifUtil.mappedToString(json['Major'] as Map<String, dynamic>),
      OnvifUtil.mappedToString(json['Minor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SupportedVersionToJson(SupportedVersion instance) =>
    <String, dynamic>{
      'Major': instance.major,
      'Minor': instance.minor,
    };
