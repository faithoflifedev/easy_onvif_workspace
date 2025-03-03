import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'include.g.dart';

@JsonSerializable()
class Include {
  @JsonKey(name: '@href')
  final String href;

  Include({required this.href});

  factory Include.fromJson(Map<String, dynamic> json) =>
      _$IncludeFromJson(json);

  Map<String, dynamic> toJson() => _$IncludeToJson(this);

  @override
  String toString() => json.encode(toJson());
}
