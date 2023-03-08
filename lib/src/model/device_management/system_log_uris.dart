import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'system_log.dart';

part 'system_log_uris.g.dart';

@JsonSerializable()
class SystemLogUris {
  @JsonKey(name: 'SystemLog', fromJson: _unbound)
  final List<SystemLog>? systemLogs;

  SystemLogUris({required this.systemLogs});

  factory SystemLogUris.fromJson(Map<String, dynamic> json) =>
      _$SystemLogUrisFromJson(json);

  Map<String, dynamic> toJson() => _$SystemLogUrisToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<SystemLog> _unbound(dynamic json) {
    if (json is List) {
      return json
          .map((e) => SystemLog.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [SystemLog.fromJson(json as Map<String, dynamic>)];
  }
}
