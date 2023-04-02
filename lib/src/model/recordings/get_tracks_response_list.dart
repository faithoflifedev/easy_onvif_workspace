import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'get_tracks_response_item.dart';

part 'get_tracks_response_list.g.dart';

/// GetRecordings shall return a description of all the recordings in the
/// device. This description shall include a list of all the tracks for each
/// recording.
@JsonSerializable()
class GetTracksResponseList {
  /// List of recording items.
  @JsonKey(name: 'Track', fromJson: _unboundTracksItem)
  final List<GetTracksResponseItem> recordingItems;

  GetTracksResponseList({required this.recordingItems});

  factory GetTracksResponseList.fromJson(Map<String, dynamic> json) =>
      _$GetTracksResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$GetTracksResponseListToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<GetTracksResponseItem> _unboundTracksItem(dynamic json) {
    if (json == null) {
      return <GetTracksResponseItem>[];
    } else if (json is List) {
      return json
          .map((e) => GetTracksResponseItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [GetTracksResponseItem.fromJson(json as Map<String, dynamic>)];
  }
}
