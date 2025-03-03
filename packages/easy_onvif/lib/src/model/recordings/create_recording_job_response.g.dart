// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_recording_job_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRecordingJobResponse _$CreateRecordingJobResponseFromJson(
  Map<String, dynamic> json,
) => CreateRecordingJobResponse(
  token: OnvifUtil.stringMappedFromXml(
    json['JobToken'] as Map<String, dynamic>,
  ),
  jobConfiguration: RecordingJobConfiguration.fromJson(
    json['JobConfiguration'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CreateRecordingJobResponseToJson(
  CreateRecordingJobResponse instance,
) => <String, dynamic>{
  'JobToken': instance.token,
  'JobConfiguration': instance.jobConfiguration,
};
