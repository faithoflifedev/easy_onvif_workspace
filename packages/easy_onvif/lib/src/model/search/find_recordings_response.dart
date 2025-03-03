import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'find_recordings_response.g.dart';

/// Returns information about a single Recording specified by a RecordingToken.
/// This operation is mandatory to support for a device implementing the
/// recording search service.
@JsonSerializable()
class FindRecordingsResponse {
  @JsonKey(name: 'SearchToken', fromJson: OnvifUtil.stringMappedFromXml)
  final String searchToken;

  FindRecordingsResponse({required this.searchToken});

  factory FindRecordingsResponse.fromJson(Map<String, dynamic> json) =>
      _$FindRecordingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FindRecordingsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
