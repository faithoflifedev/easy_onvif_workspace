import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'video_source_configuration_options.dart';

part 'get_video_source_configuration_options_response.g.dart';

/// This operation returns the available options (supported values and ranges
/// for video source configuration parameters) when the video source parameters
/// are reconfigured If a video source configuration is specified, the options
/// shall concern that particular configuration. If a media profile is
/// specified, the options shall be compatible with that media profile.
@JsonSerializable()
class GetVideoSourceConfigurationOptionsResponse {
  /// This message contains the video source configuration options. If a video
  /// source configuration is specified, the options shall concern that
  /// particular configuration. If a media profile is specified, the options
  /// shall be compatible with that media profile. If no tokens are specified,
  /// the options shall be considered generic for the device.
  @JsonKey(name: 'Options')
  final VideoSourceConfigurationOptions options;

  GetVideoSourceConfigurationOptionsResponse({required this.options});

  factory GetVideoSourceConfigurationOptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetVideoSourceConfigurationOptionsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetVideoSourceConfigurationOptionsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
