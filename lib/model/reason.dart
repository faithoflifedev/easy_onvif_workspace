import 'package:json_annotation/json_annotation.dart';

import 'i8nText.dart';

part 'reason.g.dart';

@JsonSerializable(explicitToJson: true)
class Reason {
  @JsonKey(name: 'Text')
  final I8nText i8nText;

  String get why => i8nText.text;

  Reason(this.i8nText);

  factory Reason.fromJson(Map<String, dynamic> json) => _$ReasonFromJson(json);

  Map<String, dynamic> toJson() => _$ReasonToJson(this);
}
