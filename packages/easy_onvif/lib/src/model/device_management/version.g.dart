// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Version _$VersionFromJson(Map<String, dynamic> json) => Version(
      major: OnvifUtil.intMappedFromXml(json['Major'] as Map<String, dynamic>),
      minor: OnvifUtil.intMappedFromXml(json['Minor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'Major': instance.major,
      'Minor': instance.minor,
    };
