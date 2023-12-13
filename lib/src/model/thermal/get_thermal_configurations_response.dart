import 'package:json_annotation/json_annotation.dart';

import 'thermal_configuration.dart';

part 'get_thermal_configurations_response.g.dart';

/// Gets the Thermal Configuration for all thermal VideoSources of the Device.
@JsonSerializable()
class GetThermalConfigurationsResponse {
  /// This element contains a list of thermal VideoSource configurations.
  @JsonKey(name: 'Configurations')
  List<ThermalConfiguration> configurations;

  GetThermalConfigurationsResponse({
    required this.configurations,
  });

  factory GetThermalConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetThermalConfigurationsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetThermalConfigurationsResponseToJson(this);
}
