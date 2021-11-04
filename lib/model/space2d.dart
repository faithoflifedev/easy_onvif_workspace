import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'space.dart';

part 'space2d.g.dart';

///The Pan/Tilt limits element should be present for a PTZ Node that supports an
///absolute Pan/Tilt. If the element is present it signals the support for
///configurable Pan/Tilt limits. If limits are enabled, the Pan/Tilt movements
///shall always stay within the specified range. The Pan/Tilt limits are
///disabled by setting the limits to –INF or +INF.
@JsonSerializable(explicitToJson: true)
class Space2D {
  ///Capability information.
  @JsonKey(name: 'URI')
  final dynamic xmlUri;

  @JsonKey(name: 'XRange')
  final Space xRange;

  @JsonKey(name: 'YRange')
  final Space yRange;

  Space2D({required this.xmlUri, required this.xRange, required this.yRange});

  String get uri => xmlUri['\$'];

  factory Space2D.fromJson(Map<String, dynamic> json) =>
      _$Space2DFromJson(json);

  Map<String, dynamic> toJson() => _$Space2DToJson(this);

  @override
  String toString() => json.encode(toJson());
}
