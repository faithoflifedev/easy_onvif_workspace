import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'get_tracks_response_list.dart';
import 'recording_configuration.dart';

part 'get_recordings_response_item.g.dart';

/// recording item.
@JsonSerializable()
class GetRecordingsResponseItem {
  /// Token of the recording.
  @JsonKey(name: 'RecordingToken', fromJson: OnvifUtil.mappedToString)
  final String recordingToken;

  /// Configuration of the recording.
  @JsonKey(name: 'Configuration')
  final RecordingConfiguration configuration;

  /// Configuration of the recording.
  @JsonKey(name: 'Tracks')
  final GetTracksResponseList tracks;

  GetRecordingsResponseItem({
    required this.recordingToken,
    required this.configuration,
    required this.tracks,
  });

  factory GetRecordingsResponseItem.fromJson(Map<String, dynamic> json) =>
      _$GetRecordingsResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecordingsResponseItemToJson(this);

  @override
  String toString() => json.encode(toJson());
}
