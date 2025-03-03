import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'recording_job_state_source.dart';
import 'tracks.dart';

part 'recording_job_state_information.g.dart';

/// The current state of the recording job.
@JsonSerializable()
class RecordingJobStateInformation {
  /// Identification of the recording that the recording job records to.
  @JsonKey(name: 'RecordingToken', fromJson: OnvifUtil.stringMappedFromXml)
  final String recordingToken;

  /// Holds the aggregated state over the whole RecordingJobInformation structure.
  @JsonKey(name: 'State', fromJson: OnvifUtil.stringMappedFromXml)
  final String state;

  /// Identifies the data source of the recording job.
  @JsonKey(name: 'Sources', fromJson: _fromJson)
  final List<RecordingJobStateSource> sources;

  /// List of track items.
  @JsonKey(name: 'Tracks')
  final Tracks? tracks;

  @JsonKey(name: 'Extension')
  final Map<String, dynamic>? extension;

  RecordingJobStateInformation({
    required this.recordingToken,
    required this.state,
    required this.sources,
    this.tracks,
    this.extension,
  });

  factory RecordingJobStateInformation.fromJson(Map<String, dynamic> json) =>
      _$RecordingJobStateInformationFromJson(json);

  Map<String, dynamic> toJson() => _$RecordingJobStateInformationToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<RecordingJobStateSource> _fromJson(dynamic json) =>
      OnvifUtil.jsonList<RecordingJobStateSource>(
        json,
        (json) =>
            RecordingJobStateSource.fromJson(json as Map<String, dynamic>),
      );
}
