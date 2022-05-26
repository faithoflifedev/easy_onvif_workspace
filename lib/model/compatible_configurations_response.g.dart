// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compatible_configurations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCompatibleConfigurationsResponse
    _$GetCompatibleConfigurationsResponseFromJson(Map<String, dynamic> json) =>
        GetCompatibleConfigurationsResponse(
          ptzConfigurations:
              Ptz.ptzConfigurationConverter(json['PTZConfiguration']),
        );

Map<String, dynamic> _$GetCompatibleConfigurationsResponseToJson(
        GetCompatibleConfigurationsResponse instance) =>
    <String, dynamic>{
      'PTZConfiguration':
          instance.ptzConfigurations.map((e) => e.toJson()).toList(),
    };
