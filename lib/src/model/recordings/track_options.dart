import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'track_options.g.dart';

@JsonSerializable()
class TrackOptions {
  /// Total spare number of tracks that can be added to this recording.
  @JsonKey(name: '@SpareTotal', fromJson: int.parse)
  final int spareTotal;

  /// Number of spare Video tracks that can be added to this recording.
  @JsonKey(name: '@SpareVideo', fromJson: int.parse)
  final int spareVideo;

  /// Number of spare Audio tracks that can be added to this recording.
  @JsonKey(name: '@SpareAudio', fromJson: int.parse)
  final int spareAudio;

  /// Number of spare Metadata tracks that can be added to this recording.
  @JsonKey(name: '@SpareMetadata', fromJson: int.parse)
  final int spareMetadata;

  TrackOptions({
    required this.spareTotal,
    required this.spareVideo,
    required this.spareAudio,
    required this.spareMetadata,
  });

  factory TrackOptions.fromJson(Map<String, dynamic> json) =>
      _$TrackOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$TrackOptionsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
