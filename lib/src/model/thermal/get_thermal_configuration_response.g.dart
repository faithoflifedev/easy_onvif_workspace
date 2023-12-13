// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_thermal_configuration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetThermalConfigurationResponse _$GetThermalConfigurationResponseFromJson(
        Map<String, dynamic> json) =>
    GetThermalConfigurationResponse(
      configuration: ThermalConfiguration.fromJson(
          json['Configuration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetThermalConfigurationResponseToJson(
        GetThermalConfigurationResponse instance) =>
    <String, dynamic>{
      'Configuration': instance.configuration,
    };
