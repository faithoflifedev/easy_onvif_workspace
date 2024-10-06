import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'recording_information.dart';

part 'get_recording_information_response.g.dart';

/// Returns information about a single Recording specified by a RecordingToken.
/// This operation is mandatory to support for a device implementing the
/// recording search service.
@JsonSerializable()
class GetRecordingInformationResponse {
  @JsonKey(name: 'RecordingInformation')
  final RecordingInformation recordingInformation;

  GetRecordingInformationResponse({required this.recordingInformation});

  factory GetRecordingInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRecordingInformationResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetRecordingInformationResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
