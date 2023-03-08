import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'capabilities.g.dart';

@JsonSerializable()
class Capabilities {
  /// Indicates whether or not EFlip is supported.
  @JsonKey(name: '@EFlip', fromJson: OnvifUtil.stringToBool)
  final bool eFlip;

  /// Indicates whether or not reversing of PT control direction is supported.
  @JsonKey(name: '@Reverse', fromJson: OnvifUtil.stringToBool)
  final bool reverse;

  /// Indicates support for the GetCompatibleConfigurations command.
  @JsonKey(
      name: '@GetCompatibleConfigurations', fromJson: OnvifUtil.stringToBool)
  final bool getCompatibleConfigurations;

  /// Indicates that the PTZStatus includes Position information.
  @JsonKey(name: '@MoveStatus', fromJson: OnvifUtil.stringToBool)
  final bool moveStatus;

  /// Indication of the methods of MoveAndTrack that are supported, acceptable
  /// values are defined in tt:MoveAndTrackMethod.
  @JsonKey(name: '@MoveAndTrack', fromJson: OnvifUtil.nullableStringToList)
  final List<String>? moveAndTrack;

  Capabilities({
    required this.eFlip,
    required this.reverse,
    required this.getCompatibleConfigurations,
    required this.moveStatus,
    required this.moveAndTrack,
  });

  factory Capabilities.fromJson(Map<String, dynamic> json) =>
      _$CapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
