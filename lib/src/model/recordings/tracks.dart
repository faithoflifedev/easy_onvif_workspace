import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'track.dart';

part 'tracks.g.dart';

@JsonSerializable()
class Tracks {
  /// Identifies the data source of the recording job.
  @JsonKey(name: 'Track', fromJson: _unboundTracks)
  final List<Track> tracks;

  Tracks({
    required this.tracks,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);

  Map<String, dynamic> toJson() => _$TracksToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<Track> _unboundTracks(dynamic json) {
    if (json == null) {
      return <Track>[];
    } else if (json is List) {
      return json
          .map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [Track.fromJson(json as Map<String, dynamic>)];
  }
}
