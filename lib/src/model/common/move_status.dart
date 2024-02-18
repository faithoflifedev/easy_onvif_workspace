import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_status.g.dart';

@JsonSerializable()
class MoveStatus {
  @JsonKey(
    name: 'PanTilt',
    fromJson: OnvifUtil.nullableMappedToString,
  )
  final String? panTilt;

  @JsonKey(
    name: 'Zoom',
    fromJson: OnvifUtil.nullableMappedToString,
  )
  final String? zoom;

  MoveStatus({this.panTilt, this.zoom});

  factory MoveStatus.fromJson(Map<String, dynamic> json) =>
      _$MoveStatusFromJson(json);

  Map<String, dynamic> toJson() => _$MoveStatusToJson(this);

  @override
  String toString() => json.encode(toJson());
}
