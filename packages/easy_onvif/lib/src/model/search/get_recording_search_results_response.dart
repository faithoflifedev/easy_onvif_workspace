import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'find_recording_result.dart';

part 'get_recording_search_results_response.g.dart';

/// GetRecordingSearchResults acquires the results from a recording search
/// session previously initiated by a FindRecordings operation. The response
/// shall not include results already returned in previous requests for the same
/// session. If MaxResults is specified, the response shall not contain more
/// than MaxResults results. The number of results relates to the number of
/// recordings. For viewing individual recorded data for a signal track use the
/// FindEvents method.
///
/// GetRecordingSearchResults shall block until:
/// - MaxResults results are available for the response if MaxResults is specified.
/// - MinResults results are available for the response if MinResults is specified.
/// - WaitTime has expired.
/// - Search is completed or stopped.
/// This operation is mandatory to support for a device implementing the recording search service.
@JsonSerializable()
class GetRecordingSearchResultsResponse {
  @JsonKey(name: 'ResultList', fromJson: _fromJson)
  final List<FindRecordingResult> findRecordingResults;

  GetRecordingSearchResultsResponse({required this.findRecordingResults});

  factory GetRecordingSearchResultsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetRecordingSearchResultsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetRecordingSearchResultsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<FindRecordingResult> _fromJson(dynamic json) =>
      OnvifUtil.jsonList<FindRecordingResult>(json,
          (json) => FindRecordingResult.fromJson(json as Map<String, dynamic>));
}
