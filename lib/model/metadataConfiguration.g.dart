// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadataConfiguration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaDataConfiguration _$MetaDataConfigurationFromJson(
        Map<String, dynamic> json) =>
    MetaDataConfiguration(
      json['@token'] as String,
      json['Name'],
      json['UseCount'],
    );

Map<String, dynamic> _$MetaDataConfigurationToJson(
        MetaDataConfiguration instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Name': instance.xmlName,
      'UseCount': instance.xmlUseCount,
    };
