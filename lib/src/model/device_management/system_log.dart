import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_log.g.dart';

@JsonSerializable()
class SystemLog {
  @JsonKey(name: 'Type', fromJson: OnvifUtil.mappedToString)
  final String type;

  @JsonKey(name: 'Uri', fromJson: OnvifUtil.nullableMappedToString)
  final String? uri;

  SystemLog({required this.type, this.uri});

  factory SystemLog.fromJson(Map<String, dynamic> json) =>
      _$SystemLogFromJson(json);

  Map<String, dynamic> toJson() => _$SystemLogToJson(this);

  @override
  String toString() => json.encode(toJson());
}
