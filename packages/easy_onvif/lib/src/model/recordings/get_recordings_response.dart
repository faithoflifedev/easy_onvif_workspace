import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'get_recordings_response_item.dart';

part 'get_recordings_response.g.dart';

/// GetRecordings shall return a description of all the recordings in the
/// device. This description shall include a list of all the tracks for each
/// recording.
@JsonSerializable()
class GetRecordingsResponse {
  /// List of recording items.
  @JsonKey(name: 'RecordingItem', fromJson: _fromJson)
  final List<GetRecordingsResponseItem> recordingItems;

  GetRecordingsResponse({required this.recordingItems});

  factory GetRecordingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRecordingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecordingsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<GetRecordingsResponseItem> _fromJson(dynamic json) =>
      OnvifUtil.jsonList<GetRecordingsResponseItem>(
        json,
        (json) =>
            GetRecordingsResponseItem.fromJson(json as Map<String, dynamic>),
      );
}
