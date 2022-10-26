import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'video_source_configuration.dart';
import 'audio_source_configuration.dart';
import 'video_encoder_configuration.dart';
import 'audio_encoder_configuration.dart';
import 'video_analytics_configuration.dart';
import 'ptz_configuration.dart';

part 'profile.g.dart';

///representation of a profile that exist in the media service
@JsonSerializable(explicitToJson: true)
class Profile {
  ///Unique identifier of the profile.
  @JsonKey(name: '@token')
  final String token;

  ///A value of true signals that the profile cannot be deleted. Default is
  ///false.
  @JsonKey(name: '@fixed', fromJson: OnvifUtil.stringToBool)
  final bool fixed;

  ///User readable name of the profile.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  ///Optional configuration of the Video input.
  @JsonKey(name: 'VideoSourceConfiguration')
  final VideoSourceConfiguration? videoSourceConfiguration;

  ///Optional configuration of the Audio input.
  @JsonKey(name: 'AudioSourceConfiguration')
  final AudioSourceConfiguration? audioSourceConfiguration;

  ///Optional configuration of the Video encoder.
  @JsonKey(name: 'VideoEncoderConfiguration')
  final VideoEncoderConfiguration? videoEncoderConfiguration;

  ///Optional configuration of the Audio encoder.
  @JsonKey(name: 'AudioEncoderConfiguration')
  final AudioEncoderConfiguration? audioEncoderConfiguration;

  ///Optional configuration of the video analytics module and rule engine.
  @JsonKey(name: 'VideoAnalyticsConfiguration')
  final VideoAnalyticsConfiguration? videoAnalyticsConfiguration;

  ///Optional configuration of the pan tilt zoom unit.
  @JsonKey(name: 'PTZConfiguration')
  final PtzConfiguration? ptzConfiguration;

  Profile(
      {required this.token,
      required this.fixed,
      required this.name,
      this.videoSourceConfiguration,
      this.audioSourceConfiguration,
      this.videoEncoderConfiguration,
      this.audioEncoderConfiguration,
      this.videoAnalyticsConfiguration,
      this.ptzConfiguration});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
