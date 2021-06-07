import 'package:json_annotation/json_annotation.dart';

import 'videoSources.dart';

part 'videoSourcesResponse.g.dart';

///This operation lists all available physical video inputs of the device.
@JsonSerializable(explicitToJson: true)
class GetVideoSourcesResponse {
  ///List of existing Video Sources
  @JsonKey(name: 'VideoSources')
  final VideoSources videoSources;

  GetVideoSourcesResponse(this.videoSources);

  factory GetVideoSourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVideoSourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVideoSourcesResponseToJson(this);
}
