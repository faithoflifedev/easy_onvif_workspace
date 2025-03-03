// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_metadata_configuration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMetadataConfigurationResponse _$GetMetadataConfigurationResponseFromJson(
  Map<String, dynamic> json,
) => GetMetadataConfigurationResponse(
  configuration: MetadataConfiguration.fromJson(
    json['Configuration'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetMetadataConfigurationResponseToJson(
  GetMetadataConfigurationResponse instance,
) => <String, dynamic>{'Configuration': instance.configuration};
