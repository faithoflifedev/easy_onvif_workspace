import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'io_capabilities.g.dart';

@JsonSerializable()
class IoCapabilities {
  /// Number of input connectors.
  @JsonKey(name: 'InputConnectors', fromJson: OnvifUtil.nullableMappedToInt)
  final int? inputConnectors;

  /// Number of relay outputs.
  @JsonKey(name: 'RelayOutputs', fromJson: OnvifUtil.nullableMappedToInt)
  final int? relayOutputs;

  @JsonKey(name: 'Extension')
  Map<String, dynamic>? extension;

  IoCapabilities({
    this.inputConnectors,
    this.relayOutputs,
    this.extension,
  });

  factory IoCapabilities.fromJson(Map<String, dynamic> json) =>
      _$IoCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$IoCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
