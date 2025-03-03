// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recordings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecordingsResponse _$GetRecordingsResponseFromJson(
  Map<String, dynamic> json,
) => GetRecordingsResponse(
  recordingItems: GetRecordingsResponse._fromJson(json['RecordingItem']),
);

Map<String, dynamic> _$GetRecordingsResponseToJson(
  GetRecordingsResponse instance,
) => <String, dynamic>{'RecordingItem': instance.recordingItems};
