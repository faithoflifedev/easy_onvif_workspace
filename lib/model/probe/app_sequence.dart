import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_sequence.g.dart';

@JsonSerializable(explicitToJson: true)
class AppSequence {
  @JsonKey(name: '@MessageNumber', fromJson: int.parse)
  final int messageNumber;

  @JsonKey(name: '@InstanceId', fromJson: int.parse)
  final int instanceId;

  AppSequence({required this.messageNumber, required this.instanceId});

  factory AppSequence.fromJson(Map<String, dynamic> json) =>
      _$AppSequenceFromJson(json);

  Map<String, dynamic> toJson() => _$AppSequenceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
