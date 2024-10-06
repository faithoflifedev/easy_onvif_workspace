import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'get_tracks_response_item.dart';

part 'get_tracks_response_list.g.dart';

/// GetRecordings shall return a description of all the recordings in the
/// device. This description shall include a list of all the tracks for each
/// recording.
@JsonSerializable()
class GetTracksResponseList {
  /// List of recording items.
  @JsonKey(name: 'Track', fromJson: _fromJson)
  final List<GetTracksResponseItem> recordingItems;

  GetTracksResponseList({required this.recordingItems});

  factory GetTracksResponseList.fromJson(Map<String, dynamic> json) =>
      _$GetTracksResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$GetTracksResponseListToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<GetTracksResponseItem> _fromJson(dynamic json) =>
      OnvifUtil.jsonList<GetTracksResponseItem>(
          json,
          (json) =>
              GetTracksResponseItem.fromJson(json as Map<String, dynamic>));
}
