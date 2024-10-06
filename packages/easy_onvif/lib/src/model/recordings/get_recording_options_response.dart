import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'recording_options.dart';

part 'get_recording_options_response.g.dart';

/// GetRecordingOptions returns information for a recording identified by the
/// RecordingToken. The information includes the number of additional tracks as
/// well as recording jobs that can be configured.
@JsonSerializable()
class GetRecordingOptionsResponse {
  /// Configuration of the recording.
  @JsonKey(name: 'Options')
  final RecordingOptions options;

  GetRecordingOptionsResponse({
    required this.options,
  });

  factory GetRecordingOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRecordingOptionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecordingOptionsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
