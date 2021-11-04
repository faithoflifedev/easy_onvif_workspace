import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'space.g.dart';

///A range of x or y-axis.
@JsonSerializable()
class Space {
  ///Capability information.
  @JsonKey(name: 'Min')
  final dynamic xmlMin;

  @JsonKey(name: 'Max')
  final dynamic xmlMax;

  Space({required this.xmlMin, required this.xmlMax});

  double get min => double.parse(xmlMin['\$']);

  double get max => double.parse(xmlMax['\$']);

  factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);

  Map<String, dynamic> toJson() => _$SpaceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
