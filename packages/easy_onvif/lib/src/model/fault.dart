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

  @JsonKey(name: 'Node', fromJson: OnvifUtil.nullableMappedToString)
  final String? node;

  @JsonKey(name: 'Role', fromJson: OnvifUtil.nullableMappedToString)
  final String? role;

  @JsonKey(name: 'Detail')
  final Map<String, dynamic>? detail;

  Fault({
    this.code,
    this.reason,
    this.node,
    this.role,
    this.detail,
  });

  factory Fault.fromJson(Map<String, dynamic> json) => _$FaultFromJson(json);

  Map<String, dynamic> toJson() => _$FaultToJson(this);

  @override
  String toString() => json.encode(toJson());
}
