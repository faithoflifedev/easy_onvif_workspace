import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'goto_home_position_response.g.dart';

@JsonSerializable()
class GotoHomePositionResponse {
  GotoHomePositionResponse();

  factory GotoHomePositionResponse.fromJson(Map<String, dynamic> json) =>
      _$GotoHomePositionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GotoHomePositionResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
