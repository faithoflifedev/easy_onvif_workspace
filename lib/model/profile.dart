import 'package:json_annotation/json_annotation.dart';

import 'videoSourceConfiguration.dart';
import 'audioSourceConfiguration.dart';
import 'videoEncoderConfiguration.dart';
import 'audioEncoderConfiguration.dart';
import 'videoAnalyticsConfiguration.dart';
import 'ptzConfiguration.dart';

part 'profile.g.dart';

@JsonSerializable(explicitToJson: true)
class Profile {
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: '@fixed')
  final dynamic xmlFixed;

  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'VideoSourceConfiguration')
  final VideoSourceConfiguration videoSourceConfiguration;

  @JsonKey(name: 'AudioSourceConfiguration')
  final AudioSourceConfiguration audioSourceConfiguration;

  @JsonKey(name: 'VideoEncoderConfiguration')
  final VideoEncoderConfiguration? videoEncoderConfiguration;

  @JsonKey(name: 'AudioEncoderConfiguration')
  final AudioEncoderConfiguration audioEncoderConfiguration;

  @JsonKey(name: 'VideoAnalyticsConfiguration')
  final VideoAnalyticsConfiguration videoAnalyticsConfiguration;

  @JsonKey(name: 'PTZConfiguration')
  final PTZConfiguration ptzConfiguration;

  bool get fixed => xmlFixed['\$'].toLowerCase() == 'true';

  String get name => xmlName['\$'];

  Profile(
      {required this.token,
      this.xmlFixed,
      this.xmlName,
      required this.videoSourceConfiguration,
      required this.audioSourceConfiguration,
      this.videoEncoderConfiguration,
      required this.audioEncoderConfiguration,
      required this.videoAnalyticsConfiguration,
      required this.ptzConfiguration});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
