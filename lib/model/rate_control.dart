import 'dart:convert';

import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rate_control.g.dart';

@JsonSerializable()

///Optional element to configure rate control related parameters.
class RateControl {
  ///Maximum output framerate in fps. If an EncodingInterval is provided the
  ///resulting encoded framerate will be reduced by the given factor.
  @JsonKey(name: 'FrameRateLimit', fromJson: OnvifUtil.mappedToInt)
  final int frameRateLimit;

  ///Interval at which images are encoded and transmitted. (A value of 1 means
  ///that every frame is encoded, a value of 2 means that every 2nd frame is
  ///encoded ...)
  @JsonKey(name: 'EncodingInterval', fromJson: OnvifUtil.mappedToInt)
  final int encodingInterval;

  ///the maximum output bitrate in kbps
  @JsonKey(name: 'BitrateLimit', fromJson: OnvifUtil.mappedToInt)
  final int bitrateLimit;

  RateControl(
      {required this.frameRateLimit,
      required this.encodingInterval,
      required this.bitrateLimit});

  factory RateControl.fromJson(Map<String, dynamic> json) =>
      _$RateControlFromJson(json);

  Map<String, dynamic> toJson() => _$RateControlToJson(this);

  @override
  String toString() => json.encode(toJson());
}
