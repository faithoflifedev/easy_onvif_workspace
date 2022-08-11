import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'continuous_move_response.g.dart';

@JsonSerializable()
class ContinuousMoveResponse {
  ContinuousMoveResponse();

  factory ContinuousMoveResponse.fromJson(Map<String, dynamic> json) =>
      _$ContinuousMoveResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContinuousMoveResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
