import 'package:json_annotation/json_annotation.dart';

import 'resolution.dart';

part 'videoSources.g.dart';

///List of existing Video Sources
@JsonSerializable(explicitToJson: true)
class VideoSources {
  ///Unique identifier referencing the physical entity.
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Framerate')
  final dynamic xmlFrameRate;

  ///Horizontal and vertical resolution
  @JsonKey(name: 'Resolution')
  final Resolution resolution;

  //@JsonKey(name: 'Imaging')
  //final Imaging imaging;

  ///Frame rate in frames per second.
  String get frameRate => xmlFrameRate['\$'];

  VideoSources(
      {required this.token,
      required this.xmlFrameRate,
      required this.resolution});

  factory VideoSources.fromJson(Map<String, dynamic> json) =>
      _$VideoSourcesFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSourcesToJson(this);
}
