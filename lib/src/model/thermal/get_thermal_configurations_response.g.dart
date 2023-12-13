// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_thermal_configurations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetThermalConfigurationsResponse _$GetThermalConfigurationsResponseFromJson(
        Map<String, dynamic> json) =>
    GetThermalConfigurationsResponse(
      configurations: (json['Configurations'] as List<dynamic>)
          .map((e) => ThermalConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetThermalConfigurationsResponseToJson(
        GetThermalConfigurationsResponse instance) =>
    <String, dynamic>{
      'Configurations': instance.configurations,
    };
