import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_capabilities.g.dart';

/// Streaming capabilities.
@JsonSerializable()
class ProfileCapabilities {
  /// Indicates support for live media streaming via RTSP.
  @JsonKey(
    name: '@MaximumNumberOfProfiles',
    fromJson: int.parse,
  )
  final int maximumNumberOfProfiles;

  /// Indicates support for RTP multicast.
  @JsonKey(
      name: 'ConfigurationsSupported', fromJson: OnvifUtil.nullableStringToList)
  final List<String>? configurationsSupported;

  ProfileCapabilities({
    required this.maximumNumberOfProfiles,
    required this.configurationsSupported,
  });

  factory ProfileCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ProfileCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
