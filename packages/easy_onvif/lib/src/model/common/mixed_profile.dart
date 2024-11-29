import 'dart:convert';

import 'package:easy_onvif/media1.dart';
import 'package:easy_onvif/media2.dart';
import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mixed_profile.g.dart';

/// A special case class that has the fields for both a media1 `Profile` and a
/// media2 `MediaProfile`.
@JsonSerializable()
class MixedProfile {
  /// Unique identifier of the profile.
  @JsonKey(name: '@token')
  final String token;

  /// A value of true signals that the profile cannot be deleted. Default is
  /// false.
  @JsonKey(name: '@fixed', fromJson: OnvifUtil.nullableStringToBool)
  final bool? fixed;

  /// User readable name of the profile.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.stringMappedFromXml)
  final String name;

  @JsonKey(name: 'Configurations')
  final ConfigurationSet? configurations;

  /// Optional configuration of the Video input.
  @JsonKey(name: 'VideoSourceConfiguration')
  final VideoSourceConfiguration? videoSourceConfiguration;

  /// Optional configuration of the Audio input.
  @JsonKey(name: 'AudioSourceConfiguration')
  final AudioSourceConfiguration? audioSourceConfiguration;

  /// Optional configuration of the Video encoder.
  @JsonKey(name: 'VideoEncoderConfiguration')
  final VideoEncoderConfiguration? videoEncoderConfiguration;

  /// Optional configuration of the Audio encoder.
  @JsonKey(name: 'AudioEncoderConfiguration')
  final AudioEncoderConfiguration? audioEncoderConfiguration;

  /// Optional configuration of the video analytics module and rule engine.
  @JsonKey(name: 'VideoAnalyticsConfiguration')
  final VideoAnalyticsConfiguration? videoAnalyticsConfiguration;

  /// Optional configuration of the pan tilt zoom unit.
  @JsonKey(name: 'PTZConfiguration')
  final PtzConfiguration? ptzConfiguration;

  MixedProfile(
      {required this.token,
      required this.fixed,
      required this.name,
      this.configurations,
      this.videoSourceConfiguration,
      this.audioSourceConfiguration,
      this.videoEncoderConfiguration,
      this.audioEncoderConfiguration,
      this.videoAnalyticsConfiguration,
      this.ptzConfiguration});

  factory MixedProfile.fromJson(Map<String, dynamic> json) =>
      _$MixedProfileFromJson(json);

  Map<String, dynamic> toJson() => _$MixedProfileToJson(this);

  bool get isMedia2 => configurations != null;

  factory MixedProfile.fromMediaProfile(MediaProfile mediaProfile) =>
      MixedProfile(
        token: mediaProfile.token,
        fixed: mediaProfile.fixed,
        name: mediaProfile.name,
        configurations: mediaProfile.configurations,
      );

  factory MixedProfile.fromProfile(Profile profile) => MixedProfile(
      token: profile.token,
      fixed: profile.fixed,
      name: profile.name,
      videoSourceConfiguration: profile.videoSourceConfiguration,
      audioSourceConfiguration: profile.audioSourceConfiguration,
      videoEncoderConfiguration: profile.videoEncoderConfiguration,
      audioEncoderConfiguration: profile.audioEncoderConfiguration,
      videoAnalyticsConfiguration: profile.videoAnalyticsConfiguration,
      ptzConfiguration: profile.ptzConfiguration);

  @override
  String toString() => json.encode(toJson());
}
