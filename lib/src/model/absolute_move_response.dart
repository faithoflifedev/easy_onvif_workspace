import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'absolute_move_response.g.dart';

@JsonSerializable()
class AbsoluteMoveResponse {
  AbsoluteMoveResponse();

  factory AbsoluteMoveResponse.fromJson(Map<String, dynamic> json) =>
      _$AbsoluteMoveResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AbsoluteMoveResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
