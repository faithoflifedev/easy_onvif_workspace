import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'ptz_move_status.g.dart';

@JsonSerializable()
class PtzMoveStatus {
  @JsonKey(name: 'PanTilt')
  final MoveStatus? panTilt;

  @JsonKey(name: 'Zoom')
  final MoveStatus? zoom;

  PtzMoveStatus({this.panTilt, this.zoom});

  factory PtzMoveStatus.fromJson(Map<String, dynamic> json) =>
      _$PtzMoveStatusFromJson(json);

  Map<String, dynamic> toJson() => _$PtzMoveStatusToJson(this);

  @override
  String toString() => json.encode(toJson());
}

@JsonEnum()
enum MoveStatus {
  auto('IDLE'),
  manual('MOVING'),
  unknown('UNKNOWN');

  const MoveStatus(this.status);
  final String status;
}
