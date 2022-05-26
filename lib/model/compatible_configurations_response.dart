import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ptz_configuration.dart';

part 'compatible_configurations_response.g.dart';

///Operation to get all available PTZConfigurations that can be added to the
///referenced media profile.
///
///A device providing more than one PTZConfiguration or more than one
///VideoSourceConfiguration or which has any other resource interdependency
///between PTZConfiguration entities and other resources listable in a media
///profile should implement this operation. PTZConfiguration entities returned
///by this operation shall not fail on adding them to the referenced media
///profile.
@JsonSerializable(explicitToJson: true)
class GetCompatibleConfigurationsResponse {
  ///A list of all existing PTZConfigurations on the NVT that is suitable to be
  ///added to the addressed media profile.
  @JsonKey(name: 'PTZConfiguration', fromJson: Ptz.ptzConfigurationConverter)
  final List<PtzConfiguration> ptzConfigurations;

  GetCompatibleConfigurationsResponse({required this.ptzConfigurations});

  factory GetCompatibleConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetCompatibleConfigurationsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetCompatibleConfigurationsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
