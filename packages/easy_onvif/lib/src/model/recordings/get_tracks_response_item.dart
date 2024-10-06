import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'track_configuration.dart';

part 'get_tracks_response_item.g.dart';

/// Configuration of a track.
@JsonSerializable()
class GetTracksResponseItem {
  /// Token of the track.
  @JsonKey(name: 'TrackToken', fromJson: OnvifUtil.mappedToString)
  final String trackToken;

  /// Configuration of the recording.
  @JsonKey(name: 'Configuration')
  final TrackConfiguration configuration;

  GetTracksResponseItem({
    required this.trackToken,
    required this.configuration,
  });

  factory GetTracksResponseItem.fromJson(Map<String, dynamic> json) =>
      _$GetTracksResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$GetTracksResponseItemToJson(this);

  @override
  String toString() => json.encode(toJson());
}
