// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_recording_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRecordingResponse _$CreateRecordingResponseFromJson(
        Map<String, dynamic> json) =>
    CreateRecordingResponse(
      token: OnvifUtil.mappedToString(json['RecordingToken']),
    );

Map<String, dynamic> _$CreateRecordingResponseToJson(
        CreateRecordingResponse instance) =>
    <String, dynamic>{
      'RecordingToken': instance.token,
    };
