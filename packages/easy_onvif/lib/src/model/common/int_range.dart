import 'dart:convert';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'int_range.g.dart';

/// Rectangle specifying the Video capturing area. The capturing area shall not
/// be larger than the whole Video source area.
@JsonSerializable()
class IntRange {
  /// Range of X-axis.
  @JsonKey(name: 'Min', fromJson: OnvifUtil.intMappedFromXml)
  final int min;

  /// Range of Y-axis.
  @JsonKey(name: 'Max', fromJson: OnvifUtil.intMappedFromXml)
  final int max;

  IntRange({required this.min, required this.max});

  factory IntRange.fromJson(Map<String, dynamic> json) =>
      _$IntRangeFromJson(json);

  Map<String, dynamic> toJson() => _$IntRangeToJson(this);

  @override
  String toString() => json.encode(toJson());
}
