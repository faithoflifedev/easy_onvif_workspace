import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'focus_status_20.g.dart';

/// Status of focus.
@JsonSerializable()
class FocusStatus20 {
  /// Status of focus position.
  @JsonKey(name: 'Position', fromJson: OnvifUtil.doubleMappedFromXml)
  final double position;

  /// Status of focus MoveStatus.
  @JsonKey(name: 'MoveStatus', fromJson: OnvifUtil.stringMappedFromXml)
  final String moveStatus;

  /// Error status of focus.
  @JsonKey(name: 'Error', fromJson: OnvifUtil.nullableStringMappedFromXml)
  final String? error;

  @JsonKey(name: 'Extension')
  final Map<String, dynamic>? extension;

  FocusStatus20({
    required this.position,
    required this.moveStatus,
    this.error,
    this.extension,
  });

  factory FocusStatus20.fromJson(Map<String, dynamic> json) =>
      _$FocusStatus20FromJson(json);

  Map<String, dynamic> toJson() => _$FocusStatus20ToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
