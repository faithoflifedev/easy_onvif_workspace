import 'dart:convert';

// import 'package:easy_onvif/util.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ptz_spaces.dart';
import 'duration_range.dart';
import 'pt_control_direction.dart';

part 'ptz_configuration_options.g.dart';

@JsonSerializable()
class PtzConfigurationOptions {
  /// The list of acceleration ramps supported by the device. The smallest
  /// acceleration value corresponds to the minimal index, the highest
  /// acceleration corresponds to the maximum index.
  @JsonKey(name: 'PTZRamps', fromJson: OnvifUtil.nullableIntMappedFromXmlList)
  final List<int>? ptzRamps;

  /// A list of supported coordinate systems including their range limitations.
  @JsonKey(name: 'Spaces')
  final PtzSpaces spaces;

  /// A timeout Range within which Timeouts are accepted by the PTZ Node.
  @JsonKey(name: 'PTZTimeout')
  final DurationRange ptzTimeout;

  /// Supported options for PT Direction Control.
  @JsonKey(name: 'PTControlDirection')
  final PtControlDirectionOptions? ptControlDirection;

  @JsonKey(name: 'Extension')
  final Map<String, dynamic>? extension;

  PtzConfigurationOptions({
    required this.ptzRamps,
    required this.spaces,
    required this.ptzTimeout,
    required this.ptControlDirection,
    this.extension,
  });

  factory PtzConfigurationOptions.fromJson(Map<String, dynamic> json) =>
      _$PtzConfigurationOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$PtzConfigurationOptionsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
