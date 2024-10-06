import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'replay_configuration.dart';

part 'get_replay_configuration_response.g.dart';

/// Returns the current configuration of the replay service. This operation is
/// mandatory.
@JsonSerializable()
class GetReplayConfigurationResponse {
  /// The current replay configuration parameters.
  @JsonKey(name: 'Configuration')
  final ReplayConfiguration configuration;

  GetReplayConfigurationResponse({required this.configuration});

  factory GetReplayConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReplayConfigurationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetReplayConfigurationResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
