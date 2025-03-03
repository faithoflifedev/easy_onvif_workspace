import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_rate_control2.g.dart';

@JsonSerializable()
/// Optional element to configure rate control related parameters.
class VideoRateControl2 {
  /// Enforce constant bitrate.
  @JsonKey(name: '@ConstantBitRate', fromJson: bool.parse)
  final bool constantBitRate;

  /// Desired frame rate in fps. The actual rate may be lower due to e.g.
  /// performance limitations.
  @JsonKey(name: 'FrameRateLimit', fromJson: OnvifUtil.doubleMappedFromXml)
  final double frameRateLimit;

  /// the maximum output bitrate in kbps
  @JsonKey(name: 'BitrateLimit', fromJson: OnvifUtil.intMappedFromXml)
  final int bitrateLimit;

  VideoRateControl2({
    required this.constantBitRate,
    required this.frameRateLimit,
    required this.bitrateLimit,
  });

  factory VideoRateControl2.fromJson(Map<String, dynamic> json) =>
      _$VideoRateControl2FromJson(json);

  Map<String, dynamic> toJson() => _$VideoRateControl2ToJson(this);

  @override
  String toString() => json.encode(toJson());
}
