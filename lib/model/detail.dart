import 'package:json_annotation/json_annotation.dart';

import 'i8nText.dart';

part 'detail.g.dart';

@JsonSerializable(explicitToJson: true)
class Detail {
  @JsonKey(name: 'Text')
  final I8nText i8nText;

  String get text => i8nText.text;

  Detail(this.i8nText);

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}
