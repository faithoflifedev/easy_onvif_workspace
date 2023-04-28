import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_source_configuration_options.g.dart';

/// This message contains the video source configuration options. If a video
/// source configuration is specified, the options shall concern that particular
/// configuration. If a media profile is specified, the options shall be
/// compatible with that media profile. If no tokens are specified, the options
/// shall be considered generic for the device.
@JsonSerializable()
class VideoSourceConfigurationOptions {
  /// Maximum number of profiles.
  @JsonKey(
      name: 'MaximumNumberOfProfiles', fromJson: OnvifUtil.nullableMappedToInt)
  final int? maximumNumberOfProfiles;

  /// Supported range for the capturing area. Device that does not support
  /// cropped streaming shall express BoundsRange option as mentioned below
  /// BoundsRange->XRange and BoundsRange->YRange with same Min/Max values
  /// HeightRange and WidthRange Min/Max values same as VideoSource Height and
  /// Width Limits.
  @JsonKey(name: 'BoundsRange')
  final IntRectangleRange boundsRange;

  @JsonKey(
    name: 'VideoSourceTokensAvailable',
    fromJson: OnvifUtil.mappedToStringList,
  )
  final List<String> videoSourceTokensAvailable;

  @JsonKey(name: 'Extension')
  final Map<String, dynamic>? extension;

  VideoSourceConfigurationOptions({
    required this.maximumNumberOfProfiles,
    required this.boundsRange,
    required this.videoSourceTokensAvailable,
    this.extension,
  });

  factory VideoSourceConfigurationOptions.fromJson(Map<String, dynamic> json) =>
      _$VideoSourceConfigurationOptionsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VideoSourceConfigurationOptionsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
