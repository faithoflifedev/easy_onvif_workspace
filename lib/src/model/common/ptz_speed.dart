import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'pan_tilt.dart';
import 'zoom.dart';

part 'ptz_speed.g.dart';

///If the PTZ Node supports absolute or relative PTZ movements, it shall specify
///corresponding default Pan/Tilt and Zoom speeds.
@JsonSerializable()
class PtzSpeed {
  ///Capability information.
  @JsonKey(name: 'Capabilities')
  final PanTilt? panTilt;
  final Zoom? zoom;

  PtzSpeed({this.panTilt, this.zoom});

  factory PtzSpeed.fromJson(Map<String, dynamic> json) =>
      _$PtzSpeedFromJson(json);

  Map<String, dynamic> toJson() => _$PtzSpeedToJson(this);

  @override
  String toString() => json.encode(toJson());
}
