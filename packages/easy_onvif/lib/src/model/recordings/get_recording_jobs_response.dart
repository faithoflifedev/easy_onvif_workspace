import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'get_recording_jobs_response_item.dart';

part 'get_recording_jobs_response.g.dart';

/// GetRecordingJobs shall return a list of all the recording jobs in the
/// device.
@JsonSerializable()
class GetRecordingJobsResponse {
  /// List of recording jobs.
  @JsonKey(name: 'JobItem', fromJson: _fromJson)
  final List<GetRecordingJobsResponseItem> jobItems;

  GetRecordingJobsResponse({required this.jobItems});

  factory GetRecordingJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRecordingJobsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecordingJobsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<GetRecordingJobsResponseItem> _fromJson(dynamic json) =>
      OnvifUtil.jsonList<GetRecordingJobsResponseItem>(
        json,
        (json) =>
            GetRecordingJobsResponseItem.fromJson(json as Map<String, dynamic>),
      );
}
