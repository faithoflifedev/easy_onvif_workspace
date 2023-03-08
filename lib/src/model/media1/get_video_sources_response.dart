import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'video_source.dart';

part 'get_video_sources_response.g.dart';

///This operation lists all available physical video inputs of the device.
@JsonSerializable()
class GetVideoSourcesResponse {
  ///List of existing Video Sources
  @JsonKey(name: 'VideoSources', fromJson: _videoSourcesConvertor)
  final List<VideoSource> videoSources;

  GetVideoSourcesResponse(this.videoSources);

  factory GetVideoSourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVideoSourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVideoSourcesResponseToJson(this);

  static List<VideoSource> _videoSourcesConvertor(dynamic json) {
    if (json is List) {
      return json
          .map((e) => VideoSource.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [VideoSource.fromJson(json as Map<String, dynamic>)];
  }

  @override
  String toString() => json.encode(toJson());
}
