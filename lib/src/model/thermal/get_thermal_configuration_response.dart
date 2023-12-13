import 'package:json_annotation/json_annotation.dart';

import 'thermal_configuration.dart';

part 'get_thermal_configuration_response.g.dart';

/// Gets the Thermal Configuration for the requested VideoSource.
@JsonSerializable()
class GetThermalConfigurationResponse {
  /// Thermal Settings for the VideoSource that was requested.
  @JsonKey(name: 'Configuration')
  ThermalConfiguration configuration;

  GetThermalConfigurationResponse({
    required this.configuration,
  });

  factory GetThermalConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetThermalConfigurationResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetThermalConfigurationResponseToJson(this);
}
