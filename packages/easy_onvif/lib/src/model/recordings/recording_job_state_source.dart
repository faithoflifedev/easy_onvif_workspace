import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'source_token.dart';
import 'tracks.dart';

part 'recording_job_state_source.g.dart';

/// Identifies the data source of the recording job.
@JsonSerializable()
class RecordingJobStateSource {
  /// Configuration of the recording.
  @JsonKey(name: 'SourceToken')
  final SourceToken sourceToken;

  /// Holds the aggregated state over all substructures of
  /// RecordingJobStateSource.
  @JsonKey(name: 'State', fromJson: OnvifUtil.mappedToString)
  final String state;

  /// Configuration of the recording.
  @JsonKey(name: 'Tracks')
  final Tracks tracks;

  RecordingJobStateSource({
    required this.sourceToken,
    required this.state,
    required this.tracks,
  });

  factory RecordingJobStateSource.fromJson(Map<String, dynamic> json) =>
      _$RecordingJobStateSourceFromJson(json);

  Map<String, dynamic> toJson() => _$RecordingJobStateSourceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
