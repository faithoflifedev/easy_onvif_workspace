import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'capabilities.g.dart';

@JsonSerializable()
class Capabilities {
  /// Indicates whether or not EFlip is supported.
  @JsonKey(name: '@EFlip', fromJson: OnvifUtil.nullableStringToBool)
  final bool? eFlip;

  /// Indicates whether or not reversing of PT control direction is supported.
  @JsonKey(name: '@Reverse', fromJson: OnvifUtil.nullableStringToBool)
  final bool? reverse;

  /// Indicates support for the GetCompatibleConfigurations command.
  @JsonKey(
      name: '@GetCompatibleConfigurations',
      fromJson: OnvifUtil.nullableStringToBool)
  final bool? getCompatibleConfigurations;

  /// Indicates that the PTZStatus includes Position information.
  @JsonKey(name: '@MoveStatus', fromJson: OnvifUtil.nullableStringToBool)
  final bool? moveStatus;

  /// Indication of the methods of MoveAndTrack that are supported, acceptable
  /// values are defined in tt:MoveAndTrackMethod.
  @JsonKey(name: '@MoveAndTrack', fromJson: OnvifUtil.nullableStringToList)
  final List<String>? moveAndTrack;

  Capabilities({
    this.eFlip,
    this.reverse,
    this.getCompatibleConfigurations,
    this.moveStatus,
    this.moveAndTrack,
  });

  factory Capabilities.fromJson(Map<String, dynamic> json) =>
      _$CapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
