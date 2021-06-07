import 'package:json_annotation/json_annotation.dart';

import 'bounds.dart';

part 'videoSourceConfiguration.g.dart';

///Optional configuration of the Video input.
@JsonSerializable(explicitToJson: true)
class VideoSourceConfiguration {
  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  ///Reference to the physical input.
  @JsonKey(name: 'SourceToken')
  final dynamic sourceToken;

  ///Rectangle specifying the Video capturing area. The capturing area shall not
  ///be larger than the whole Video source area.
  @JsonKey(name: 'Bounds')
  final Bounds bounds;

  ///User readable name. Length up to 64 characters.
  String get name => xmlName['\$'];

  ///Number of internal references currently using this configuration.
  int get useCount => int.parse(xmlUseCount['\$']);

  VideoSourceConfiguration(
      this.xmlName, this.xmlUseCount, this.sourceToken, this.bounds);

  factory VideoSourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VideoSourceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSourceConfigurationToJson(this);
}
