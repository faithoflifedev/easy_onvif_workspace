// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_job_state_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordingJobStateSource _$RecordingJobStateSourceFromJson(
  Map<String, dynamic> json,
) => RecordingJobStateSource(
  sourceToken: SourceToken.fromJson(
    json['SourceToken'] as Map<String, dynamic>,
  ),
  state: OnvifUtil.stringMappedFromXml(json['State'] as Map<String, dynamic>),
  tracks: Tracks.fromJson(json['Tracks'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RecordingJobStateSourceToJson(
  RecordingJobStateSource instance,
) => <String, dynamic>{
  'SourceToken': instance.sourceToken,
  'State': instance.state,
  'Tracks': instance.tracks,
};
