import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'system_log_uris.dart';

part 'system_uris_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetSystemUrisResponse {
  @JsonKey(name: 'SystemLogUris')
  final SystemLogUris systemLogUris;

  @JsonKey(name: 'SupportInfoUri')
  final dynamic supportInfoUri;

  @JsonKey(name: 'SystemBackupUri')
  final dynamic systemBackupUri;

  GetSystemUrisResponse(
      {required this.systemLogUris, this.supportInfoUri, this.systemBackupUri});

  factory GetSystemUrisResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSystemUrisResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSystemUrisResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
