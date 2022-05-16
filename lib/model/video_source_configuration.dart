import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bounds.dart';

part 'video_source_configuration.g.dart';

///Optional configuration of the Video input.
@JsonSerializable(explicitToJson: true)
class VideoSourceConfiguration {
  ///User readable name. Length up to 64 characters.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  ///Number of internal references currently using this configuration.
  @JsonKey(name: 'UseCount', fromJson: OnvifUtil.mappedToInt)
  final int useCount;

  ///Reference to the physical input.
  @JsonKey(name: 'SourceToken', fromJson: OnvifUtil.mappedToString)
  final String sourceToken;

  ///Rectangle specifying the Video capturing area. The capturing area shall not
  ///be larger than the whole Video source area.
  @JsonKey(name: 'Bounds')
  final Bounds bounds;

  @JsonKey(name: 'Extension')
  final dynamic extension;

  VideoSourceConfiguration(
      this.name, this.useCount, this.sourceToken, this.bounds, this.extension);

  factory VideoSourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VideoSourceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSourceConfigurationToJson(this);
}
