import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'system_information.dart';

part 'get_system_log_response.g.dart';

/// This operation gets a system log from the device. The exact format of the
/// system logs is outside the scope of this standard.
@JsonSerializable()
class GetSystemLogResponse {
  /// Contains the system log information.
  @JsonKey(name: 'SystemLog')
  final SystemInformation systemLog;

  GetSystemLogResponse({required this.systemLog});

  factory GetSystemLogResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSystemLogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSystemLogResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
