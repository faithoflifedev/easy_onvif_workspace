import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'focus.g.dart';

///Focus configuration.
@JsonSerializable()
class Focus {
  /// AutoFocusMode - enum { 'AUTO', 'MANUAL' }
  @JsonKey(
    name: 'AutoFocusMode',
    unknownEnumValue: AutoFocusMode.manual,
    fromJson: mappedToAutoFocusMode,
  )
  final AutoFocusMode autoFocusMode;

  ///Optional level parameter (unit unspecified).
  @JsonKey(
    name: 'DefaultSpeed',
    fromJson: OnvifUtil.mappedToDouble,
  )
  final double? defaultSpeed;

  ///Parameter to set auto-focus near limit (unit: meter).
  @JsonKey(
    name: 'NearLimit',
    fromJson: OnvifUtil.mappedToDouble,
  )
  final double? nearLimit;

  @JsonKey(
    name: 'FarLimit',
    fromJson: OnvifUtil.mappedToDouble,
  )
  final double? farLimit;

  Focus(
      {required this.autoFocusMode,
      required this.defaultSpeed,
      required this.nearLimit,
      required this.farLimit});

  factory Focus.fromJson(Map<String, dynamic> json) => _$FocusFromJson(json);

  Map<String, dynamic> toJson() => _$FocusToJson(this);

  static AutoFocusMode mappedToAutoFocusMode(Map<String, dynamic> value) =>
      AutoFocusMode.values.byName(value['\$'].toString().toLowerCase());

  @override
  String toString() => json.encode(toJson());
}

@JsonEnum()
enum AutoFocusMode {
  auto('AUTO'),
  manual('MANUAL');

  const AutoFocusMode(this.value);
  final String value;
}
