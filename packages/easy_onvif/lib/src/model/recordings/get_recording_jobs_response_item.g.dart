// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recording_jobs_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecordingJobsResponseItem _$GetRecordingJobsResponseItemFromJson(
        Map<String, dynamic> json) =>
    GetRecordingJobsResponseItem(
      jobToken: OnvifUtil.mappedToString(json['JobToken']),
      jobConfiguration: RecordingJobConfiguration.fromJson(
          json['JobConfiguration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRecordingJobsResponseItemToJson(
        GetRecordingJobsResponseItem instance) =>
    <String, dynamic>{
      'JobToken': instance.jobToken,
      'JobConfiguration': instance.jobConfiguration,
    };
