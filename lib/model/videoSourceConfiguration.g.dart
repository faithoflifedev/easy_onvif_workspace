// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoSourceConfiguration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoSourceConfiguration _$VideoSourceConfigurationFromJson(
    Map<String, dynamic> json) {
  return VideoSourceConfiguration(
    json['Name'],
    json['UseCount'],
    json['SourceToken'],
    Bounds.fromJson(json['Bounds'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VideoSourceConfigurationToJson(
        VideoSourceConfiguration instance) =>
    <String, dynamic>{
      'Name': instance.xmlName,
      'UseCount': instance.xmlUseCount,
      'SourceToken': instance.sourceToken,
      'Bounds': instance.bounds.toJson(),
    };
