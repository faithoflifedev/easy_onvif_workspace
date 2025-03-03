import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_recording_response.g.dart';

@JsonSerializable()
class CreateRecordingResponse {
  /// The reference to the created recording.
  @JsonKey(name: 'RecordingToken', fromJson: OnvifUtil.stringMappedFromXml)
  final String token;

  CreateRecordingResponse({required this.token});

  factory CreateRecordingResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRecordingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRecordingResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
