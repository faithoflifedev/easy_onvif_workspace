import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'white_balance.g.dart';

///White balance settings.
@JsonSerializable()
class WhiteBalance {
  ///Auto white-balancing mode (auto/manual).
  ///- enum { 'AUTO', 'MANUAL' }
  @JsonKey(name: 'Mode', fromJson: OnvifUtil.mappedToString)
  final String mode;

  ///Rgain (unitless).
  @JsonKey(name: 'CrGain', fromJson: OnvifUtil.mappedToDouble)
  final double? crGain;

  ///Bgain (unitless).
  @JsonKey(name: 'CbGain', fromJson: OnvifUtil.mappedToDouble)
  final double? cbGain;

  WhiteBalance(
      {required this.mode, required this.crGain, required this.cbGain});

  factory WhiteBalance.fromJson(Map<String, dynamic> json) =>
      _$WhiteBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$WhiteBalanceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
