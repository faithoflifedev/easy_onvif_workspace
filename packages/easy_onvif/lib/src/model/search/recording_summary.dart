import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recording_summary.g.dart';

@JsonSerializable()
class RecordingSummary {
  /// The current replay configuration parameters.
  @JsonKey(name: 'DataFrom', fromJson: OnvifUtil.nullableMappedStdToDateTime)
  final DateTime? dataFrom;

  /// The earliest point in time where there is recorded data on the device.
  @JsonKey(name: 'DataUntil', fromJson: OnvifUtil.nullableMappedStdToDateTime)
  final DateTime? dataUntil;

  /// The most recent point in time where there is recorded data on the device.
  @JsonKey(name: 'NumberRecordings', fromJson: OnvifUtil.intMappedFromXml)
  final int numberRecordings;

  RecordingSummary({
    required this.dataFrom,
    required this.dataUntil,
    required this.numberRecordings,
  });

  factory RecordingSummary.fromJson(Map<String, dynamic> json) =>
      _$RecordingSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$RecordingSummaryToJson(this);

  @override
  String toString() => json.encode(toJson());
}
