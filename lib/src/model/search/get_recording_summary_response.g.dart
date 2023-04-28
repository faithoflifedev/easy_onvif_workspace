// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recording_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecordingSummaryResponse _$GetRecordingSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    GetRecordingSummaryResponse(
      summary:
          RecordingSummary.fromJson(json['Summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRecordingSummaryResponseToJson(
        GetRecordingSummaryResponse instance) =>
    <String, dynamic>{
      'Summary': instance.summary,
    };
