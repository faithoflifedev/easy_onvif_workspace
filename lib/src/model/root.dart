import 'package:json_annotation/json_annotation.dart';

import 'envelope.dart';

part 'root.g.dart';

@JsonSerializable(explicitToJson: true)
class Root {
  @JsonKey(name: 'Envelope')
  final Envelope envelope;

  Root(this.envelope);

  factory Root.fromJson(Map<String, dynamic> json) => _$RootFromJson(json);

  Map<String, dynamic> toJson() => _$RootToJson(this);
}
