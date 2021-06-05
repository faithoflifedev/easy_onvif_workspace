import 'package:json_annotation/json_annotation.dart';

import 'videoSources.dart';

part 'videoSourcesResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetVideoSourcesResponse {
  @JsonKey(name: 'VideoSources')
  final VideoSources videoSources;

  GetVideoSourcesResponse(this.videoSources);

  factory GetVideoSourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVideoSourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVideoSourcesResponseToJson(this);
}
