// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_recordings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindRecordingsResponse _$FindRecordingsResponseFromJson(
  Map<String, dynamic> json,
) => FindRecordingsResponse(
  searchToken: OnvifUtil.stringMappedFromXml(
    json['SearchToken'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$FindRecordingsResponseToJson(
  FindRecordingsResponse instance,
) => <String, dynamic>{'SearchToken': instance.searchToken};
