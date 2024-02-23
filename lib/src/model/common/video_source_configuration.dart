import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'int_rectangle.dart';

part 'video_source_configuration.g.dart';

///Optional configuration of the Video input.
@JsonSerializable()
class VideoSourceConfiguration {
  /// Token that uniquely references this configuration. Length up to 64
  /// characters.
  @JsonKey(name: '@token')
  final String token;

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
  final IntRectangle bounds;

  @JsonKey(name: 'Extension')
  final dynamic extension;

  VideoSourceConfiguration({
    required this.token,
    required this.name,
    required this.useCount,
    required this.sourceToken,
    required this.bounds,
    required this.extension,
  });

  factory VideoSourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VideoSourceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSourceConfigurationToJson(this);
}
