import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'code.dart';
import 'reason.dart';

part 'fault.g.dart';

@JsonSerializable()
class Fault {
  @JsonKey(name: 'Code')
  final Code? code;

  @JsonKey(name: 'Reason')
  final Reason? reason;

  @JsonKey(name: 'Node')
  final Map<String, dynamic>? mappedNode;

  @JsonKey(name: 'Role')
  final Map<String, dynamic>? mappedRole;

  @JsonKey(name: 'Detail')
  final Map<String, dynamic>? detail;

  String? get node => OnvifUtil.nullableStringMappedFromXml(mappedNode);

  String? get role => OnvifUtil.nullableStringMappedFromXml(mappedRole);

  Fault({
    this.code,
    this.reason,
    this.mappedNode,
    this.mappedRole,
    this.detail,
  });

  factory Fault.fromJson(Map<String, dynamic> json) => _$FaultFromJson(json);

  Map<String, dynamic> toJson() => _$FaultToJson(this);

  @override
  String toString() => json.encode(toJson());
}
