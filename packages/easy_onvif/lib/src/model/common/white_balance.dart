import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'white_balance.g.dart';

///White balance settings.
@JsonSerializable()
class WhiteBalance {
  ///Auto white-balancing mode (auto/manual).
  ///- enum { 'AUTO', 'MANUAL' }
  @JsonKey(name: 'Mode', fromJson: OnvifUtil.stringMappedFromXml)
  final String mode;

  /// Rgain (unit-less).
  @JsonKey(name: 'CrGain', fromJson: OnvifUtil.doubleMappedFromXml)
  final double? crGain;

  /// Bgain (unit-less).
  @JsonKey(name: 'CbGain', fromJson: OnvifUtil.doubleMappedFromXml)
  final double? cbGain;

  WhiteBalance(
      {required this.mode, required this.crGain, required this.cbGain});

  factory WhiteBalance.fromJson(Map<String, dynamic> json) =>
      _$WhiteBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$WhiteBalanceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
