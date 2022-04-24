import 'package:json_annotation/json_annotation.dart';

part 'app_sequence.g.dart';

@JsonSerializable(explicitToJson: true)
class AppSequence {
  @JsonKey(name: '@MessageNumber')
  final dynamic xmlMessageNumber;

  @JsonKey(name: '@InstanceId')
  final dynamic xmlInstanceId;

  int get messageNumber => int.parse(xmlMessageNumber['\$']);

  int get instanceId => int.parse(xmlInstanceId['\$']);

  AppSequence(this.xmlMessageNumber, this.xmlInstanceId);

  factory AppSequence.fromJson(Map<String, dynamic> json) =>
      _$AppSequenceFromJson(json);

  Map<String, dynamic> toJson() => _$AppSequenceToJson(this);
}
