import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'capabilities.g.dart';

/// The capabilities for the imaging service is returned in the Capabilities
/// element.
@JsonSerializable()
class Capabilities {
  /// Indicates whether or not Image Stabilization feature is supported. The use
  /// of this capability is deprecated, a client should use GetOption to find
  /// out if image stabilization is supported.
  @JsonKey(name: '@ImageStabilization', fromJson: OnvifUtil.stringToBool)
  final bool imageStabilization;

  /// Indicates whether or not Imaging Presets feature is supported.
  @JsonKey(name: '@Presets', fromJson: OnvifUtil.optionalBool)
  final bool? presets;

  /// Indicates whether or not imaging preset settings can be updated.
  @JsonKey(name: '@AdaptablePreset', fromJson: OnvifUtil.optionalBool)
  final bool? adaptablePreset;

  Capabilities({
    required this.imageStabilization,
    required this.presets,
    required this.adaptablePreset,
  });

  factory Capabilities.fromJson(Map<String, dynamic> json) =>
      _$CapabilitiesFromJson(json);

  // factory Capabilities.fromToken(String token) =>
  //     Capabilities(token: token, type: '', name: '');

  Map<String, dynamic> toJson() => _$CapabilitiesToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
