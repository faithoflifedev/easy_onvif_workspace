import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'backlight_compensation.g.dart';

/// List of existing Video Sources
@JsonSerializable()
class BacklightCompensation {
  static final _xmlMappedFields = <String>['Mode', 'Level'];

  /// Enabled/disabled BLC mode (on/off).
  @JsonKey(name: 'Mode', fromJson: OnvifUtil.stringMappedFromXml)
  final String mode;

  /// Optional level parameter (unit unspecified).
  @JsonKey(name: 'Level', fromJson: OnvifUtil.nullableDoubleMappedFromXml)
  final double? level;

  BacklightCompensation({required this.mode, required this.level});

  factory BacklightCompensation.fromJson(Map<String, dynamic> json) =>
      _$BacklightCompensationFromJson(json);

  Map<String, dynamic> toJson() => _$BacklightCompensationToJson(
    this,
  ).convertFieldsToXmlMap(_xmlMappedFields);

  @override
  String toString() => json.encode(toJson());
}
