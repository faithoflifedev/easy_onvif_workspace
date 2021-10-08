// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ptzConfiguration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PTZConfiguration _$PTZConfigurationFromJson(Map<String, dynamic> json) =>
    PTZConfiguration(
      json['Name'],
      json['UseCount'],
      json['NodeToken'],
    );

Map<String, dynamic> _$PTZConfigurationToJson(PTZConfiguration instance) =>
    <String, dynamic>{
      'Name': instance.xmlName,
      'UseCount': instance.xmlUseCount,
      'NodeToken': instance.nodeToken,
    };
