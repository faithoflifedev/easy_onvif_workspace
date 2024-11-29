import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'float_range.g.dart';

/// A range of x or y-axis.
@JsonSerializable()
class FloatRange {
  static final _xmlMappedFields = <String>[
    'Min',
    'Max',
  ];

  /// Capability information.
  @JsonKey(
    name: 'Min',
    fromJson: OnvifUtil.doubleMappedFromXml,
  )

  /// final double min;
  final double min;

  @JsonKey(
    name: 'Max',
    fromJson: OnvifUtil.doubleMappedFromXml,
  )
  final double max;

  FloatRange({
    required this.min,
    required this.max,
  });

  factory FloatRange.fromJson(Map<String, dynamic> json) =>
      _$FloatRangeFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FloatRangeToJson(this).convertFieldsToXmlMap(_xmlMappedFields);

  @override
  String toString() => json.encode(toJson());
}
