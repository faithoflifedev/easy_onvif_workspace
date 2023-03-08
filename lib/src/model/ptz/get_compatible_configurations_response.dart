import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_compatible_configurations_response.g.dart';

/// Operation to get all available PTZConfigurations that can be added to the
/// referenced media profile.
///
/// A device providing more than one PTZConfiguration or more than one
/// VideoSourceConfiguration or which has any other resource interdependency
/// between PTZConfiguration entities and other resources listable in a media
/// profile should implement this operation. PTZConfiguration entities returned
/// by this operation shall not fail on adding them to the referenced media
/// profile.
@JsonSerializable()
class GetCompatibleConfigurationsResponse {
  /// A list of all existing PTZConfigurations on the NVT that is suitable to be
  /// added to the addressed media profile.
  @JsonKey(name: 'PTZConfiguration', fromJson: _ptzConfigurationConverter)
  final List<PtzConfiguration> ptzConfigurations;

  GetCompatibleConfigurationsResponse({required this.ptzConfigurations});

  factory GetCompatibleConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetCompatibleConfigurationsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetCompatibleConfigurationsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<PtzConfiguration> _ptzConfigurationConverter(dynamic json) {
    if (json == null) {
      return <PtzConfiguration>[];
    } else if (json is List) {
      return json
          .map((e) => PtzConfiguration.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [PtzConfiguration.fromJson(json as Map<String, dynamic>)];
  }
}
