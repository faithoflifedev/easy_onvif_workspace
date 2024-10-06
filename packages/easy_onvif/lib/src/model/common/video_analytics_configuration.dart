import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_analytics_configuration.g.dart';

/// Optional configuration of the video analytics module and rule engine.
@JsonSerializable()
class VideoAnalyticsConfiguration {
  /// User readable name. Length up to 64 characters.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  /// Number of internal references currently using this configuration.
  /// This informational parameter is read-only. Deprecated for Media2 Service.
  @JsonKey(name: 'UseCount', fromJson: OnvifUtil.mappedToInt)
  final int useCount;

  VideoAnalyticsConfiguration({required this.name, required this.useCount});

  factory VideoAnalyticsConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VideoAnalyticsConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VideoAnalyticsConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
