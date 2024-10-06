import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'float_range.g.dart';

/// A range of x or y-axis.
@JsonSerializable()
class FloatRange {
  /// Capability information.
  @JsonKey(name: 'Min', fromJson: OnvifUtil.mappedToDouble)
  final double min;

  @JsonKey(name: 'Max', fromJson: OnvifUtil.mappedToDouble)
  final double max;

  FloatRange({
    required this.min,
    required this.max,
  });

  factory FloatRange.fromJson(Map<String, dynamic> json) =>
      _$FloatRangeFromJson(json);

  Map<String, dynamic> toJson() => _$FloatRangeToJson(this);

  @override
  String toString() => json.encode(toJson());
}
