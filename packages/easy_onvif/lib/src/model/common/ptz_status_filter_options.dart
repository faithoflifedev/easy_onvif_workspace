import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ptz_status_filter_options.g.dart';

@JsonSerializable()
class PtzStatusFilterOptions {
  /// True if the device is able to stream pan or tilt status information.
  @JsonKey(
    name: 'PanTiltStatusSupported',
    fromJson: OnvifUtil.boolMappedFromXml,
  )
  final bool panTiltStatusSupported;

  /// True if the device is able to stream zoom status information.
  @JsonKey(name: 'ZoomStatusSupported', fromJson: OnvifUtil.boolMappedFromXml)
  final bool zoomStatusSupported;

  /// True if the device is able to stream the pan or tilt position
  @JsonKey(
    name: 'PanTiltPositionSupported',
    fromJson: OnvifUtil.nullableBoolMappedFromXml,
  )
  final bool? panTiltPositionSupported;

  /// True if the device is able to stream zoom position information.
  @JsonKey(
    name: 'ZoomPositionSupported',
    fromJson: OnvifUtil.nullableBoolMappedFromXml,
  )
  final bool? zoomPositionSupported;

  @JsonKey(name: 'Extension')
  final Map<String, dynamic>? extension;

  PtzStatusFilterOptions({
    required this.panTiltStatusSupported,
    required this.zoomStatusSupported,
    this.panTiltPositionSupported,
    this.zoomPositionSupported,
    this.extension,
  });

  factory PtzStatusFilterOptions.fromJson(Map<String, dynamic> json) =>
      _$PtzStatusFilterOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$PtzStatusFilterOptionsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
