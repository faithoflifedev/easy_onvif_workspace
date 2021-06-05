import 'package:json_annotation/json_annotation.dart';

import 'panTilt.dart';
import 'zoom.dart';

part 'ptzPosition.g.dart';

@JsonSerializable()
class PtzPosition {
  @JsonKey(name: 'PanTilt')
  final PanTilt? panTilt;

  @JsonKey(name: 'Zoom')
  final Zoom? zoom;

  PtzPosition({this.panTilt, this.zoom});

  factory PtzPosition.fromJson(Map<String, dynamic> json) =>
      _$PtzPositionFromJson(json);

  Map<String, dynamic> toJson() => _$PtzPositionToJson(this);
}
