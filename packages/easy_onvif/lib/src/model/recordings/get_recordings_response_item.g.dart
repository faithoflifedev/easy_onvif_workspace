// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recordings_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecordingsResponseItem _$GetRecordingsResponseItemFromJson(
        Map<String, dynamic> json) =>
    GetRecordingsResponseItem(
      recordingToken: OnvifUtil.mappedToString(json['RecordingToken']),
      configuration: RecordingConfiguration.fromJson(
          json['Configuration'] as Map<String, dynamic>),
      tracks: GetTracksResponseList.fromJson(
          json['Tracks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRecordingsResponseItemToJson(
        GetRecordingsResponseItem instance) =>
    <String, dynamic>{
      'RecordingToken': instance.recordingToken,
      'Configuration': instance.configuration,
      'Tracks': instance.tracks,
    };
