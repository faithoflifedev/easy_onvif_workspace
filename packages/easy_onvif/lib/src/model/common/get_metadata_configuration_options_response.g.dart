// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_metadata_configuration_options_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMetadataConfigurationOptionsResponse
    _$GetMetadataConfigurationOptionsResponseFromJson(
            Map<String, dynamic> json) =>
        GetMetadataConfigurationOptionsResponse(
          options: MetadataConfigurationOptions.fromJson(
              json['Options'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$GetMetadataConfigurationOptionsResponseToJson(
        GetMetadataConfigurationOptionsResponse instance) =>
    <String, dynamic>{
      'Options': instance.options,
    };
