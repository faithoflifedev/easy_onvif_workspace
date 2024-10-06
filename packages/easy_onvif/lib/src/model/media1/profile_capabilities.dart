import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'profile_capabilities.g.dart';

@JsonSerializable()
class ProfileCapabilities {
  /// Maximum number of profiles supported.
  @JsonKey(name: '@MaximumNumberOfProfiles', fromJson: int.parse)
  final int maximumNumberOfProfiles;

  @JsonKey(name: 'ConfigurationsSupported')
  final List<ConfigurationEnumeration>? configurationEnumeration;

  ProfileCapabilities({
    required this.maximumNumberOfProfiles,
    this.configurationEnumeration,
  });

  factory ProfileCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ProfileCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}

enum ConfigurationEnumeration {
  @JsonValue('All')
  all('All'),
  @JsonValue('VideoSource')
  videoSource('VideoSource'),
  @JsonValue('VideoEncoder')
  videoEncoder('VideoEncoder'),
  @JsonValue('AudioSource')
  audioSource('AudioSource'),
  @JsonValue('AudioEncoder')
  audioEncoder('AudioEncoder'),
  @JsonValue('AudioOutput')
  audioOutput('AudioOutput'),
  @JsonValue('AudioDecoder')
  audioDecoder('AudioDecoder'),
  @JsonValue('Metadata')
  metadata('Metadata'),
  @JsonValue('Analytics')
  analytics('Analytics'),
  @JsonValue('PTZ')
  ptz('PTZ');

  const ConfigurationEnumeration(this.value);
  final String value;

  // String toJson() => name;

  // static ConfigurationEnumeration fromJson(String json) => values.byName(json);
}
