// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recording_search_results_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecordingSearchResultsResponse _$GetRecordingSearchResultsResponseFromJson(
        Map<String, dynamic> json) =>
    GetRecordingSearchResultsResponse(
      findRecordingResults:
          GetRecordingSearchResultsResponse._fromJson(json['ResultList']),
    );

Map<String, dynamic> _$GetRecordingSearchResultsResponseToJson(
        GetRecordingSearchResultsResponse instance) =>
    <String, dynamic>{
      'ResultList': instance.findRecordingResults,
    };
