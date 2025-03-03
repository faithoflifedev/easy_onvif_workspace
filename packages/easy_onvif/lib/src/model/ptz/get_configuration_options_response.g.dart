// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_configuration_options_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetConfigurationOptionsResponse _$GetConfigurationOptionsResponseFromJson(
  Map<String, dynamic> json,
) => GetConfigurationOptionsResponse(
  ptzConfigurationOptions: PtzConfigurationOptions.fromJson(
    json['PTZConfigurationOptions'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetConfigurationOptionsResponseToJson(
  GetConfigurationOptionsResponse instance,
) => <String, dynamic>{
  'PTZConfigurationOptions': instance.ptzConfigurationOptions,
};
