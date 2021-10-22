import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'i8nText.g.dart';

@JsonSerializable()
class I8nText {
  @JsonKey(name: 'lang')
  final String? lang;

  @JsonKey(name: '\$')
  final String? text;

  I8nText({this.lang, this.text});

  factory I8nText.fromJson(Map<String, dynamic> json) =>
      _$I8nTextFromJson(json);

  Map<String, dynamic> toJson() => _$I8nTextToJson(this);

  @override
  String toString() => json.encode(toJson());
}
