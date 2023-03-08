import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ptz_capabilities.g.dart';

/// PTZ capabilities
@JsonSerializable()
class PtzCapabilities {
  /// PTZ service URI.
  @JsonKey(name: 'XAddr', fromJson: OnvifUtil.mappedToString)
  final String xAddr;

  PtzCapabilities({required this.xAddr});

  factory PtzCapabilities.fromJson(Map<String, dynamic> json) =>
      _$PtzCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$PtzCapabilitiesToJson(this);
}
