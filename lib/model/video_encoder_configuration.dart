import 'package:json_annotation/json_annotation.dart';

import 'resolution.dart';
import 'rate_control.dart';
import 'mpeg4.dart';
import 'h264.dart';
import 'multicast.dart';

part 'video_encoder_configuration.g.dart';

@JsonSerializable(explicitToJson: true)

///If the video encoder configuration token is already known, the encoder
///configuration can be fetched through the GetVideoEncoderConfiguration
///command.
class VideoEncoderConfiguration {
  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  @JsonKey(name: 'Encoding')
  final dynamic xmlEncoding;

  @JsonKey(name: 'Resolution')

  ///Configured video resolution
  final Resolution resolution;

  @JsonKey(name: 'Quality')
  final dynamic xmlQuality;

  ///Optional element to configure rate control related parameters.
  @JsonKey(name: 'RateControl')
  final RateControl rateControl;

  ///Optional element to configure Mpeg4 related parameters.
  @JsonKey(name: 'MPEG4')
  final Mpeg4? mpeg4;

  ///Optional element to configure H.264 related parameters.
  @JsonKey(name: 'H264')
  final H264? h264;

  @JsonKey(name: 'Multicast')

  ///Defines the multicast settings that could be used for video streaming.
  final Multicast multiCast;

  @JsonKey(name: 'SessionTimeout')
  final dynamic xmlSessionTimeout;

  ///User readable name. Length up to 64 characters.
  String get name => xmlName['\$'];

  ///Used video codec, either Jpeg, H.264 or Mpeg4
  ///- enum { 'JPEG', 'MPEG4', 'H264' }
  String get encoding => xmlEncoding['\$'];

  ///Number of internal references currently using this configuration.
  ///This informational parameter is read-only. Deprecated for Media2 Service.
  int get useCount => int.parse(xmlUseCount['\$']);

  ///Relative value for the video quantizers and the quality of the video. A
  ///high value within supported quality range means higher quality
  double get quality => double.parse(xmlQuality['\$']);

  ///The rtsp session timeout for the related video stream
  String get sessionTimeout => xmlSessionTimeout['\$'];

  VideoEncoderConfiguration(
      {required this.xmlName,
      required this.xmlUseCount,
      required this.xmlEncoding,
      required this.resolution,
      required this.xmlQuality,
      required this.rateControl,
      this.mpeg4,
      this.h264,
      required this.multiCast,
      required this.xmlSessionTimeout});

  factory VideoEncoderConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VideoEncoderConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VideoEncoderConfigurationToJson(this);
}
