import 'package:json_annotation/json_annotation.dart';

part 'video_analytics_configuration.g.dart';

///Optional configuration of the video analytics module and rule engine.
@JsonSerializable()
class VideoAnalyticsConfiguration {
  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  //@JsonKey(name: 'AnalyticsEngineConfiguration')
  //final AnalyticsEngineConfiguration analyticsEngineConfiguration

  ///User readable name. Length up to 64 characters.
  String get name => xmlName['\$'];

  ///Number of internal references currently using this configuration.
  ///This informational parameter is read-only. Deprecated for Media2 Service.
  int get useCount => int.parse(xmlUseCount['\$']);

  VideoAnalyticsConfiguration(this.xmlName, this.xmlUseCount);

  factory VideoAnalyticsConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VideoAnalyticsConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VideoAnalyticsConfigurationToJson(this);
}
