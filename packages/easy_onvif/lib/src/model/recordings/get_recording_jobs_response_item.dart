import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'recording_job_configuration.dart';

part 'get_recording_jobs_response_item.g.dart';

/// GetRecordingJobs shall return a list of all the recording jobs in the
/// device.
@JsonSerializable()
class GetRecordingJobsResponseItem {
  /// List of recording jobs.
  @JsonKey(name: 'JobToken', fromJson: OnvifUtil.stringMappedFromXml)
  final String jobToken;

  /// List of recording jobs.
  @JsonKey(name: 'JobConfiguration')
  final RecordingJobConfiguration jobConfiguration;

  GetRecordingJobsResponseItem({
    required this.jobToken,
    required this.jobConfiguration,
  });

  factory GetRecordingJobsResponseItem.fromJson(Map<String, dynamic> json) =>
      _$GetRecordingJobsResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecordingJobsResponseItemToJson(this);

  @override
  String toString() => json.encode(toJson());
}
