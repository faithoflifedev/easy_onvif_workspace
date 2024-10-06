import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'track.dart';

part 'tracks.g.dart';

@JsonSerializable()
class Tracks {
  /// Identifies the data source of the recording job.
  @JsonKey(name: 'Track', fromJson: _fromJson)
  final List<Track> tracks;

  Tracks({
    required this.tracks,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);

  Map<String, dynamic> toJson() => _$TracksToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<Track> _fromJson(dynamic json) => OnvifUtil.jsonList<Track>(
      json, (json) => Track.fromJson(json as Map<String, dynamic>));
}
