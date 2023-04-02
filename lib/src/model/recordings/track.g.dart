// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      sourceTag:
          OnvifUtil.mappedToString(json['SourceTag'] as Map<String, dynamic>),
      destination:
          OnvifUtil.mappedToString(json['Destination'] as Map<String, dynamic>),
      error: OnvifUtil.nullableMappedToString(
          json['Error'] as Map<String, dynamic>?),
      state: Track._nullableRecordingJobState(json['State']),
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'SourceTag': instance.sourceTag,
      'Destination': instance.destination,
      'Error': instance.error,
      'State': _$RecordingJobStateEnumMap[instance.state],
    };

const _$RecordingJobStateEnumMap = {
  RecordingJobState.idle: 'Idle',
  RecordingJobState.active: 'Active',
  RecordingJobState.error: 'Error',
};
