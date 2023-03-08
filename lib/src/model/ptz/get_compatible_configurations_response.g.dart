// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_compatible_configurations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCompatibleConfigurationsResponse
    _$GetCompatibleConfigurationsResponseFromJson(Map<String, dynamic> json) =>
        GetCompatibleConfigurationsResponse(
          ptzConfigurations:
              GetCompatibleConfigurationsResponse._ptzConfigurationConverter(
                  json['PTZConfiguration']),
        );

Map<String, dynamic> _$GetCompatibleConfigurationsResponseToJson(
        GetCompatibleConfigurationsResponse instance) =>
    <String, dynamic>{
      'PTZConfiguration': instance.ptzConfigurations,
    };
