// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_recording_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindRecordingResult _$FindRecordingResultFromJson(Map<String, dynamic> json) =>
    FindRecordingResult(
      searchState: FindRecordingResult._searchState(json['SearchState']),
      recordingInformation:
          FindRecordingResult._fromJson(json['RecordingInformation']),
    );

Map<String, dynamic> _$FindRecordingResultToJson(
        FindRecordingResult instance) =>
    <String, dynamic>{
      'SearchState': _$SearchStateEnumMap[instance.searchState]!,
      'RecordingInformation': instance.recordingInformation,
    };

const _$SearchStateEnumMap = {
  SearchState.queued: 'Queued',
  SearchState.searching: 'Searching',
  SearchState.completed: 'Completed',
  SearchState.unknown: 'Unknown',
};
