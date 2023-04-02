import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'recording_job_state_information.dart';

part 'get_recording_job_state_response.g.dart';

/// GetRecordingJobState returns the state of a recording job. It includes an
/// aggregated state, and state for each track of the recording job.
@JsonSerializable()
class GetRecordingJobStateResponse {
  /// The current state of the recording job.
  @JsonKey(name: 'State')
  final RecordingJobStateInformation state;

  GetRecordingJobStateResponse({
    required this.state,
  });

  factory GetRecordingJobStateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRecordingJobStateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecordingJobStateResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
