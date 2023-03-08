import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'configuration_set.g.dart';

@JsonSerializable()
class ConfigurationSet {
  @JsonKey(name: 'VideoSourceConfiguration')
  final VideoSourceConfiguration? videoSourceConfiguration;

  @JsonKey(name: 'AudioSourceConfiguration')
  final AudioSourceConfiguration? audioSourceConfiguration;

  @JsonKey(name: 'VideoEncoderConfiguration')
  final VideoEncoderConfiguration? videoEncoderConfiguration;

  @JsonKey(name: 'AudioEncoderConfiguration')
  final AudioEncoderConfiguration? audioEncoderConfiguration;

  @JsonKey(name: 'VideoAnalyticsConfiguration')
  final VideoAnalyticsConfiguration? videoAnalyticsConfiguration;

  @JsonKey(name: 'PTZConfiguration')
  final PtzConfiguration? ptzConfiguration;

  @JsonKey(name: 'MetadataConfiguration')
  final MetadataConfiguration? metadataConfiguration;

  @JsonKey(name: 'ProfileExtension')
  final Map<String, dynamic>? extension;

  ConfigurationSet({
    this.videoSourceConfiguration,
    this.audioSourceConfiguration,
    this.videoEncoderConfiguration,
    this.audioEncoderConfiguration,
    this.videoAnalyticsConfiguration,
    this.ptzConfiguration,
    this.metadataConfiguration,
    this.extension,
  });

  factory ConfigurationSet.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationSetFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationSetToJson(this);

  @override
  String toString() => json.encode(toJson());
}
