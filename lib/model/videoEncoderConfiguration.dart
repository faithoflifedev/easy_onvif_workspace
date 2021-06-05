import 'package:json_annotation/json_annotation.dart';

import 'resolution.dart';
import 'rateControl.dart';
import 'h264.dart';
import 'multicast.dart';

part 'videoEncoderConfiguration.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoEncoderConfiguration {
  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  @JsonKey(name: 'Encoding')
  final dynamic xmlEncoding;

  @JsonKey(name: 'Resolution')
  final Resolution resolution;

  @JsonKey(name: 'Quality')
  final dynamic xmlQuality;

  @JsonKey(name: 'RateControl')
  final RateControl rateControl;

  @JsonKey(name: 'H264')
  final H264? h264;

  @JsonKey(name: 'Multicast')
  final Multicast multiCast;

  @JsonKey(name: 'SessionTimeout')
  final dynamic xmlSessionTimeout;

  String get name => xmlName['\$'];

  String get encoding => xmlEncoding['\$'];

  int get useCount => int.parse(xmlUseCount['\$']);

  double get quality => double.parse(xmlQuality['\$']);

  String get sessionTimeout => xmlSessionTimeout['\$'];

  VideoEncoderConfiguration(
      {required this.xmlName,
      required this.xmlUseCount,
      required this.xmlEncoding,
      required this.resolution,
      required this.xmlQuality,
      required this.rateControl,
      this.h264,
      required this.multiCast,
      required this.xmlSessionTimeout});

  factory VideoEncoderConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VideoEncoderConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VideoEncoderConfigurationToJson(this);
}
