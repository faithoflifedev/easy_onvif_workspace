import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

import 'space.dart';

part 'space1d.g.dart';

///The Zoom limits element should be present for a PTZ Node that supports
///absolute zoom. If the element is present it signals the supports for
///configurable Zoom limits. If limits are enabled the zoom movements shall
///always stay within the specified range. The Zoom limits are disabled by
///settings the limits to -INF and +INF.
@JsonSerializable()
class Space1D {
  ///Capability information.
  @JsonKey(name: 'URI', fromJson: OnvifUtil.mappedToString)
  final String uri;

  @JsonKey(name: 'XRange')
  final Space xRange;

  Space1D({required this.uri, required this.xRange});

  factory Space1D.fromJson(Map<String, dynamic> json) =>
      _$Space1DFromJson(json);

  Map<String, dynamic> toJson() => _$Space1DToJson(this);

  @override
  String toString() => json.encode(toJson());
}
