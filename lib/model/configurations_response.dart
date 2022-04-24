import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'ptz_configuration.dart';

part 'configurations_response.g.dart';

///Get all the existing PTZConfigurations from the device.
///
///The default Position/Translation/Velocity Spaces are introduced to allow NVCs
///sending move requests without the need to specify a certain coordinate
///system. The default Speeds are introduced to control the speed of move
///requests (absolute, relative, preset), where no explicit speed has been set.
///
///The allowed pan and tilt range for Pan/Tilt Limits is defined by a
///two-dimensional space range that is mapped to a specific Absolute Pan/Tilt
///Position Space. At least one Pan/Tilt Position Space is required by the
///PTZNode to support Pan/Tilt limits. The limits apply to all supported
///absolute, relative and continuous Pan/Tilt movements. The limits shall be
///checked within the coordinate system for which the limits have been
///specified. That means that even if movements are specified in a different
///coordinate system, the requested movements shall be transformed to the
///coordinate system of the limits where the limits can be checked. When a
///relative or continuous movements is specified, which would leave the
///specified limits, the PTZ unit has to move along the specified limits.
@JsonSerializable(explicitToJson: true)
class GetConfigurationsResponse {
  @JsonKey(name: 'PTZConfiguration', fromJson: _ptzConfigurationConverter)
  final List<PtzConfiguration> ptzConfigurations;

  GetConfigurationsResponse({required this.ptzConfigurations});

  factory GetConfigurationsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConfigurationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetConfigurationsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<PtzConfiguration> _ptzConfigurationConverter(dynamic json) {
    if (json is List) {
      return json
          .map((e) => PtzConfiguration.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [PtzConfiguration.fromJson(json as Map<String, dynamic>)];
  }
}
