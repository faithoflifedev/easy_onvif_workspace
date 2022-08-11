import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'stop_response.g.dart';

@JsonSerializable()
class StopResponse {
  StopResponse();

  factory StopResponse.fromJson(Map<String, dynamic> json) =>
      _$StopResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StopResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
