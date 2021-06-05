import 'package:json_annotation/json_annotation.dart';

import 'bounds.dart';

part 'videoSourceConfiguration.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoSourceConfiguration {
  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  @JsonKey(name: 'SourceToken')
  final dynamic sourceToken;

  @JsonKey(name: 'Bounds')
  final Bounds bounds;

  String get name => xmlName['\$'];

  int get useCount => int.parse(xmlUseCount['\$']);

  VideoSourceConfiguration(
      this.xmlName, this.xmlUseCount, this.sourceToken, this.bounds);

  factory VideoSourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VideoSourceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSourceConfigurationToJson(this);
}
