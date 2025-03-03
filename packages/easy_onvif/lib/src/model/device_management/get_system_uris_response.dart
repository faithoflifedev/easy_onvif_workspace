import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'system_log_uri_list.dart';

part 'get_system_uris_response.g.dart';

@JsonSerializable()
class GetSystemUrisResponse {
  @JsonKey(name: 'SystemLogUris')
  final SystemLogUriList? systemLogUris;

  @JsonKey(
    name: 'SupportInfoUri',
    fromJson: OnvifUtil.nullableStringMappedFromXml,
  )
  final String? supportInfoUri;

  @JsonKey(
    name: 'SystemBackupUri',
    fromJson: OnvifUtil.nullableStringMappedFromXml,
  )
  final String? systemBackupUri;

  GetSystemUrisResponse({
    required this.systemLogUris,
    this.supportInfoUri,
    this.systemBackupUri,
  });

  factory GetSystemUrisResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSystemUrisResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSystemUrisResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
