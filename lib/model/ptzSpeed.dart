import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'panTilt.dart';
import 'zoom.dart';

part 'ptzSpeed.g.dart';

///If the PTZ Node supports absolute or relative PTZ movements, it shall specify
///corresponding default Pan/Tilt and Zoom speeds.
@JsonSerializable(explicitToJson: true)
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
