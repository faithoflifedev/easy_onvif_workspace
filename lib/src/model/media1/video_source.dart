import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_source.g.dart';

///List of existing Video Sources
@JsonSerializable()
class VideoSource {
  ///Unique identifier referencing the physical entity.
  @JsonKey(name: '@token')
  final String token;

  ///Frame rate in frames per second.
  @JsonKey(name: 'Framerate', fromJson: OnvifUtil.mappedToString)
  final String frameRate;

  ///Horizontal and vertical resolution
  @JsonKey(name: 'Resolution')
  final VideoResolution resolution;

  ///Optional configuration of the image sensor.
  @JsonKey(name: 'Imaging')
  final Imaging? imaging;

  VideoSource(
      {required this.token,
      required this.frameRate,
      required this.resolution,
      this.imaging});

  factory VideoSource.fromJson(Map<String, dynamic> json) =>
      _$VideoSourceFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSourceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
