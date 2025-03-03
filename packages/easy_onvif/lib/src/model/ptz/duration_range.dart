import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'duration_range.g.dart';

/// A timeout Range within which Timeouts are accepted by the PTZ Node.
@JsonSerializable()
class DurationRange {
  static final _xmlMappedFields = <String>['Min', 'Max'];

  @JsonKey(name: 'Min', fromJson: OnvifUtil.stringMappedFromXml)
  final String min;

  @JsonKey(name: 'Max', fromJson: OnvifUtil.stringMappedFromXml)
  final String max;

  DurationRange({required this.min, required this.max});

  factory DurationRange.fromJson(Map<String, dynamic> json) =>
      _$DurationRangeFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DurationRangeToJson(this).convertFieldsToXmlMap(_xmlMappedFields);

  @override
  String toString() => json.encode(toJson());
}
