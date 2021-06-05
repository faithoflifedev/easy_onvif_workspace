import 'package:json_annotation/json_annotation.dart';

import 'resolution.dart';

part 'videoSources.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoSources {
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Framerate')
  final dynamic xmlFrameRate;

  @JsonKey(name: 'Resolution')
  final Resolution resolution;

  //@JsonKey(name: 'Imaging')
  //final Imaging imaging;

  String get frameRate => xmlFrameRate['\$'];

  VideoSources(
      {required this.token,
      required this.xmlFrameRate,
      required this.resolution});

  factory VideoSources.fromJson(Map<String, dynamic> json) =>
      _$VideoSourcesFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSourcesToJson(this);
}
