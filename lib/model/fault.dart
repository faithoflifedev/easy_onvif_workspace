import 'package:json_annotation/json_annotation.dart';

import 'code.dart';
import 'reason.dart';
import 'detail.dart';

part 'fault.g.dart';

@JsonSerializable(explicitToJson: true)
class Fault {
  @JsonKey(name: 'Code')
  final Code code;

  @JsonKey(name: 'Reason')
  final Reason reason;

  @JsonKey(name: 'Node')
  final dynamic xmlNode;

  @JsonKey(name: 'Role')
  final dynamic xmlRole;

  @JsonKey(name: 'Detail')
  final Detail detail;

  String get node => xmlNode['\$'];

  String get role => xmlRole['\$'];

  Fault(this.code, this.reason, this.xmlNode, this.xmlRole, this.detail);

  factory Fault.fromJson(Map<String, dynamic> json) => _$FaultFromJson(json);

  Map<String, dynamic> toJson() => _$FaultToJson(this);
}
