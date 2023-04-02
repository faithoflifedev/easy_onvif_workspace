import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'recording_job_configuration.dart';

part 'create_recording_job_response.g.dart';

@JsonSerializable()
class CreateRecordingJobResponse {
  /// The JobToken shall identify the created recording job.
  @JsonKey(name: 'JobToken', fromJson: OnvifUtil.mappedToString)
  final String token;

  /// The JobToken shall identify the created recording job.
  @JsonKey(name: 'JobConfiguration')
  final RecordingJobConfiguration jobConfiguration;

  CreateRecordingJobResponse({
    required this.token,
    required this.jobConfiguration,
  });

  factory CreateRecordingJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRecordingJobResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRecordingJobResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
