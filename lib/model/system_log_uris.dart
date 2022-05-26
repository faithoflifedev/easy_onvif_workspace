import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'system_log.dart';

part 'system_log_uris.g.dart';

@JsonSerializable(explicitToJson: true)
class SystemLogUris {
  @JsonKey(name: 'SystemLog')
  final SystemLog systemLog;

  SystemLogUris({required this.systemLog});

  factory SystemLogUris.fromJson(Map<String, dynamic> json) =>
      _$SystemLogUrisFromJson(json);

  Map<String, dynamic> toJson() => _$SystemLogUrisToJson(this);

  @override
  String toString() => json.encode(toJson());
}
