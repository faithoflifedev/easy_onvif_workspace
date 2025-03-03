// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recording_jobs_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecordingJobsResponseItem _$GetRecordingJobsResponseItemFromJson(
  Map<String, dynamic> json,
) => GetRecordingJobsResponseItem(
  jobToken: OnvifUtil.stringMappedFromXml(
    json['JobToken'] as Map<String, dynamic>,
  ),
  jobConfiguration: RecordingJobConfiguration.fromJson(
    json['JobConfiguration'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetRecordingJobsResponseItemToJson(
  GetRecordingJobsResponseItem instance,
) => <String, dynamic>{
  'JobToken': instance.jobToken,
  'JobConfiguration': instance.jobConfiguration,
};
