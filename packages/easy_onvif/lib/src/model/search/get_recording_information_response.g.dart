// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recording_information_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecordingInformationResponse _$GetRecordingInformationResponseFromJson(
  Map<String, dynamic> json,
) => GetRecordingInformationResponse(
  recordingInformation: RecordingInformation.fromJson(
    json['RecordingInformation'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetRecordingInformationResponseToJson(
  GetRecordingInformationResponse instance,
) => <String, dynamic>{'RecordingInformation': instance.recordingInformation};
