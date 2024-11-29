import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_replay_uri_response.g.dart';

/// Requests a URI that can be used to initiate playback of a recorded stream
/// using RTSP as the control protocol. The URI is valid only as it is specified
/// in the response. A device supporting the Replay Service shall support the
/// GetReplayUri command.
@JsonSerializable()
class GetReplayUriResponse {
  /// The URI to which the client should connect in order to stream the
  /// recording.
  @JsonKey(name: 'Uri', fromJson: OnvifUtil.stringMappedFromXml)
  final String uri;

  GetReplayUriResponse({required this.uri});

  factory GetReplayUriResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReplayUriResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetReplayUriResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
