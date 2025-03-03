// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_video_source_configuration_options_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVideoSourceConfigurationOptionsResponse
_$GetVideoSourceConfigurationOptionsResponseFromJson(
  Map<String, dynamic> json,
) => GetVideoSourceConfigurationOptionsResponse(
  options: VideoSourceConfigurationOptions.fromJson(
    json['Options'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetVideoSourceConfigurationOptionsResponseToJson(
  GetVideoSourceConfigurationOptionsResponse instance,
) => <String, dynamic>{'Options': instance.options};
