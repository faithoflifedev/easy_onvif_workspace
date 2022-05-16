import 'dart:convert';

import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'probe/app_sequence.dart';
//import 'header.dart';

part 'header.g.dart';

@JsonSerializable(explicitToJson: true)
class Header {
  @JsonKey(name: 'AppSequence')
  final AppSequence? appSequence;

  @JsonKey(name: 'MessageID', fromJson: OnvifUtil.mappedToInt)
  final int messageID;

  @JsonKey(name: 'RelatesTo', fromJson: OnvifUtil.mappedToString)
  final String relatesTo;

  @JsonKey(name: 'To', fromJson: OnvifUtil.mappedToString)
  final String to;

  @JsonKey(name: 'Action', fromJson: OnvifUtil.mappedToString)
  final String action;

  Header(
      {this.appSequence,
      required this.messageID,
      required this.relatesTo,
      required this.to,
      required this.action});

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderToJson(this);

  @override
  String toString() => json.encode(toJson());
}
