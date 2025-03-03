// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_recording_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRecordingResponse _$CreateRecordingResponseFromJson(
  Map<String, dynamic> json,
) => CreateRecordingResponse(
  token: OnvifUtil.stringMappedFromXml(
    json['RecordingToken'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CreateRecordingResponseToJson(
  CreateRecordingResponse instance,
) => <String, dynamic>{'RecordingToken': instance.token};
