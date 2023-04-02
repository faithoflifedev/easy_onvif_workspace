// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageConfiguration _$StorageConfigurationFromJson(
        Map<String, dynamic> json) =>
    StorageConfiguration(
      token: json['@token'] as String,
      data: StorageConfigurationData.fromJson(
          json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StorageConfigurationToJson(
        StorageConfiguration instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Data': instance.data,
    };
