import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'job_options.dart';
import 'track_options.dart';

part 'recording_options.g.dart';

/// Configuration of the recording.
@JsonSerializable()
class RecordingOptions {
  /// Configuration of the recording.
  @JsonKey(name: 'Job')
  final JobOptions job;

  /// Configuration of the recording.
  @JsonKey(name: 'Track')
  final TrackOptions track;

  RecordingOptions({
    required this.job,
    required this.track,
  });

  factory RecordingOptions.fromJson(Map<String, dynamic> json) =>
      _$RecordingOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$RecordingOptionsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
