import 'package:json_annotation/json_annotation.dart';

part 'videoAnalyticsConfiguration.g.dart';

@JsonSerializable()
class VideoAnalyticsConfiguration {
  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  //@JsonKey(name: 'AnalyticsEngineConfiguration')
  //final AnalyticsEngineConfiguration analyticsEngineConfiguration

  String get name => xmlName['\$'];

  int get useCount => int.parse(xmlUseCount['\$']);

  VideoAnalyticsConfiguration(this.xmlName, this.xmlUseCount);

  factory VideoAnalyticsConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VideoAnalyticsConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VideoAnalyticsConfigurationToJson(this);
}
