// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordingInformation _$RecordingInformationFromJson(
        Map<String, dynamic> json) =>
    RecordingInformation(
      recordingToken: OnvifUtil.mappedToString(
          json['RecordingToken'] as Map<String, dynamic>),
      source: RecordingSourceInformation.fromJson(
          json['Source'] as Map<String, dynamic>),
      earliestRecording: OnvifUtil.mappedToStdDateTime(
          json['EarliestRecording'] as Map<String, dynamic>),
      latestRecording: OnvifUtil.mappedToStdDateTime(
          json['LatestRecording'] as Map<String, dynamic>),
      content:
          OnvifUtil.mappedToString(json['Content'] as Map<String, dynamic>),
      tracks: RecordingInformation._fromJson(json['Track']),
      recordingStatus:
          RecordingInformation._recordingStatus(json['RecordingStatus']),
    );

Map<String, dynamic> _$RecordingInformationToJson(
        RecordingInformation instance) =>
    <String, dynamic>{
      'RecordingToken': instance.recordingToken,
      'Source': instance.source,
      'EarliestRecording': instance.earliestRecording?.toIso8601String(),
      'LatestRecording': instance.latestRecording?.toIso8601String(),
      'Content': instance.content,
      'Track': instance.tracks,
      'RecordingStatus': _$RecordingStatusEnumMap[instance.recordingStatus]!,
    };

const _$RecordingStatusEnumMap = {
  RecordingStatus.initiated: 'Initiated',
  RecordingStatus.recording: 'Recording',
  RecordingStatus.stopped: 'Stopped',
  RecordingStatus.removing: 'Removing',
  RecordingStatus.removed: 'Removed',
  RecordingStatus.unknown: 'Unknown',
};
