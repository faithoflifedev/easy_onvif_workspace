import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'focus.g.dart';

///Focus configuration.
@JsonSerializable(explicitToJson: true)
class Focus {
  ///AutoFocusMode - enum { 'AUTO', 'MANUAL' }
  @JsonKey(name: 'AutoFocusMode', fromJson: OnvifUtil.mappedToString)
  final String autoFocusMode;

  ///Optional level parameter (unit unspecified).
  @JsonKey(name: 'DefaultSpeed', fromJson: OnvifUtil.mappedToDouble)
  final double? defaultSpeed;

  ///Parameter to set autofocus near limit (unit: meter).
  @JsonKey(name: 'NearLimit', fromJson: OnvifUtil.mappedToDouble)
  final double? nearLimit;

  @JsonKey(name: 'FarLimit', fromJson: OnvifUtil.mappedToDouble)
  final double? farLimit;

  Focus(
      {required this.autoFocusMode,
      required this.defaultSpeed,
      required this.nearLimit,
      required this.farLimit});

  factory Focus.fromJson(Map<String, dynamic> json) => _$FocusFromJson(json);

  Map<String, dynamic> toJson() => _$FocusToJson(this);

  @override
  String toString() => json.encode(toJson());
}
