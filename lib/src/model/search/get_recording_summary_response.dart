import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'recording_summary.dart';

part 'get_recording_summary_response.g.dart';

/// GetRecordingSummary is used to get a summary description of all recorded
/// data. This operation is mandatory to support for a device implementing the
/// recording search service.
@JsonSerializable()
class GetRecordingSummaryResponse {
  @JsonKey(name: 'Summary')
  final RecordingSummary summary;

  GetRecordingSummaryResponse({required this.summary});

  factory GetRecordingSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRecordingSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecordingSummaryResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
