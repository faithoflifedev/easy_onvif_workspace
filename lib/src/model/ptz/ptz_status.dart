import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ptz_position.dart';

part 'ptz_status.g.dart';

@JsonSerializable()
class PtzStatus {
  @JsonKey(name: 'Position')
  final PtzPosition position;

  @JsonKey(name: 'Error', fromJson: OnvifUtil.nullableMappedToString)
  final String? error;

  @JsonKey(name: 'UtcTime', fromJson: OnvifUtil.nullableMappedToDateTime)
  DateTime? utcTime;

  PtzStatus({
    required this.position,
    this.error,
    this.utcTime,
  });

  factory PtzStatus.fromJson(Map<String, dynamic> json) =>
      _$PtzStatusFromJson(json);

  Map<String, dynamic> toJson() => _$PtzStatusToJson(this);

  @override
  String toString() => json.encode(toJson());
}
