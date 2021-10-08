// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audioDecoderConfiguration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioDecoderConfiguration _$AudioDecoderConfigurationFromJson(
        Map<String, dynamic> json) =>
    AudioDecoderConfiguration(
      json['@token'] as String,
      json['Name'],
      json['UseCount'],
    );

Map<String, dynamic> _$AudioDecoderConfigurationToJson(
        AudioDecoderConfiguration instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Name': instance.xmlName,
      'UseCount': instance.xmlUseCount,
    };
