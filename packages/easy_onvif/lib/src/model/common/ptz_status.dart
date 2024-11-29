import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ptz_vector.dart';
import 'move_status.dart';

part 'ptz_status.g.dart';

@JsonSerializable()
class PtzStatus {
  @JsonKey(name: 'Position')
  final PtzVector position;

  @JsonKey(name: 'MoveStatus')
  final MoveStatus? moveStatus;

  @JsonKey(name: 'Error', fromJson: OnvifUtil.nullableStringMappedFromXml)
  final String? error;

  @JsonKey(name: 'UtcTime', fromJson: OnvifUtil.nullableMappedToDateTime)
  DateTime? utcTime;

  PtzStatus({
    required this.position,
    this.moveStatus,
    this.error,
    this.utcTime,
  });

  factory PtzStatus.fromJson(Map<String, dynamic> json) =>
      _$PtzStatusFromJson(json);

  Map<String, dynamic> toJson() => _$PtzStatusToJson(this);

  @override
  String toString() => json.encode(toJson());
}
