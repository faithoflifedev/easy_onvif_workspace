import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'probe/app_sequence.dart';

part 'header.g.dart';

@JsonSerializable(explicitToJson: true)
class Header {
  @JsonKey(name: 'AppSequence')
  final AppSequence? appSequence;

  @JsonKey(name: 'MessageID', fromJson: OnvifUtil.nullableMappedToString)
  final String? messageID;

  @JsonKey(name: 'RelatesTo', fromJson: OnvifUtil.nullableMappedToString)
  final String? relatesTo;

  @JsonKey(name: 'To', fromJson: OnvifUtil.nullableMappedToString)
  final String? to;

  @JsonKey(name: 'Action', fromJson: OnvifUtil.nullableMappedToString)
  final String? action;

  Header(
      {this.appSequence, this.messageID, this.relatesTo, this.to, this.action});

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderToJson(this);

  @override
  String toString() => json.encode(toJson());
}
