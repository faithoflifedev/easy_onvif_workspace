import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'space.g.dart';

///A range of x or y-axis.
@JsonSerializable()
class Space {
  ///Capability information.
  @JsonKey(name: 'Min', fromJson: OnvifUtil.mappedToDouble)
  final double min;

  @JsonKey(name: 'Max', fromJson: OnvifUtil.mappedToDouble)
  final double max;

  Space({required this.min, required this.max});

  factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);

  Map<String, dynamic> toJson() => _$SpaceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
