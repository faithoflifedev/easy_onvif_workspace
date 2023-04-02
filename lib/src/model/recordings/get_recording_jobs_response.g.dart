// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recording_jobs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecordingJobsResponse _$GetRecordingJobsResponseFromJson(
        Map<String, dynamic> json) =>
    GetRecordingJobsResponse(
      jobItems: GetRecordingJobsResponse._unboundJobItems(json['JobItem']),
    );

Map<String, dynamic> _$GetRecordingJobsResponseToJson(
        GetRecordingJobsResponse instance) =>
    <String, dynamic>{
      'JobItem': instance.jobItems,
    };
