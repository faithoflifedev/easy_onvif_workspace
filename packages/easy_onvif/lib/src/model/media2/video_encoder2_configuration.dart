import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_encoder2_configuration.g.dart';

/// A video encoder configurations.
@JsonSerializable()
class VideoEncoder2Configuration {
  /// Token that uniquely references this configuration. Length up to 64
  /// characters.
  @JsonKey(name: '@token')
  final String token;

  /// User readable name. Length up to 64 characters.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.stringMappedFromXml)
  final String name;

  /// Number of internal references currently using this configuration.  This
  /// informational parameter is read-only. Deprecated for Media2 Service.
  @JsonKey(name: 'UseCount', fromJson: OnvifUtil.intMappedFromXml)
  final int? useCount;

  /// Group of Video frames length. Determines typically the interval in which
  /// the I-Frames will be coded. An entry of 1 indicates I-Frames are
  /// continuously generated. An entry of 2 indicates that every 2nd image is an
  /// I-Frame, and 3 only every 3rd frame, etc. The frames in between are coded
  /// as P or B Frames.
  @JsonKey(name: '@GovLength', fromJson: int.parse)
  final int govLength;

  /// Distance between anchor frames of type I-Frame and P-Frame. '1' indicates
  /// no B-Frames, '2' indicates that every 2nd frame is encoded as B-Frame, '3'
  /// indicates a structure like IBBPBBP..., etc.
  @JsonKey(
    name: 'AnchorFrameDistance',
    fromJson: OnvifUtil.nullableIntMappedFromXml,
  )
  final int? anchorFrameDistance;

  /// The encoder profile as defined in tt:VideoEncodingProfiles.
  @JsonKey(name: '@Profile')
  final String profile;

  /// A value of true indicates that frame rate is a fixed value rather than an
  ///  upper limit, and that the video encoder shall prioritize frame rate over
  ///  all other adaptable configuration values such as bitrate. Default is
  /// false.
  @JsonKey(
    name: 'GuaranteedFrameRate',
    fromJson: OnvifUtil.nullableBoolMappedFromXml,
  )
  bool? guaranteedFrameRate = false;

  /// Video Media Subtype for the video format. For definitions see
  /// tt:VideoEncodingMimeNames and IANA Media Types.
  @JsonKey(name: 'Encoding', fromJson: OnvifUtil.stringMappedFromXml)
  final String encoding;

  /// Configured video resolution
  @JsonKey(name: 'Resolution')
  final VideoResolution2 resolution;

  /// Optional element to configure rate control related parameters.
  @JsonKey(name: 'RateControl')
  final VideoRateControl2 rateControl;

  /// Defines the multicast settings that could be used for video streaming.
  @JsonKey(name: 'Multicast')
  final MulticastConfiguration multicast;

  /// Relative value for the video quantizers and the quality of the video. A
  /// high value within supported quality range means higher quality
  @JsonKey(name: 'Quality', fromJson: OnvifUtil.doubleMappedFromXml)
  final double quality;

  VideoEncoder2Configuration({
    required this.token,
    required this.name,
    this.useCount,
    required this.govLength,
    this.anchorFrameDistance,
    required this.profile,
    this.guaranteedFrameRate,
    required this.encoding,
    required this.resolution,
    required this.rateControl,
    required this.multicast,
    required this.quality,
  });

  factory VideoEncoder2Configuration.fromJson(Map<String, dynamic> json) =>
      _$VideoEncoder2ConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VideoEncoder2ConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
