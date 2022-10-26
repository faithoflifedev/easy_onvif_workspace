// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaDataConfiguration _$MetaDataConfigurationFromJson(
        Map<String, dynamic> json) =>
    MetaDataConfiguration(
      token: json['@token'] as String,
      name: OnvifUtil.mappedToString(json['Name'] as Map<String, dynamic>),
      useCount: OnvifUtil.mappedToInt(json['UseCount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaDataConfigurationToJson(
        MetaDataConfiguration instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Name': instance.name,
      'UseCount': instance.useCount,
    };
