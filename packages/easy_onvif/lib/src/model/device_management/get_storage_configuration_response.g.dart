// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_storage_configuration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStorageConfigurationResponse _$GetStorageConfigurationResponseFromJson(
        Map<String, dynamic> json) =>
    GetStorageConfigurationResponse(
      storageConfiguration: StorageConfiguration.fromJson(
          json['StorageConfiguration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetStorageConfigurationResponseToJson(
        GetStorageConfigurationResponse instance) =>
    <String, dynamic>{
      'StorageConfiguration': instance.storageConfiguration,
    };
