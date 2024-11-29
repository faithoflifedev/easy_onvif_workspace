import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'imaging_capabilities.g.dart';

/// Imaging capabilities
@JsonSerializable()
class ImagingCapabilities {
  /// Imaging service URI.
  @JsonKey(name: 'XAddr', fromJson: OnvifUtil.stringMappedFromXml)
  final String xAddr;

  ImagingCapabilities({required this.xAddr});

  factory ImagingCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ImagingCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagingCapabilitiesToJson(this);

  // static List<dynamic> _auxiliaryCommandsConverter(dynamic json) {
  //   if (json is List) {
  //     return json.map((e) => json).toList();
  //   }

  //   return [json];
  // }

  @override
  String toString() => json.encode(toJson());
}
