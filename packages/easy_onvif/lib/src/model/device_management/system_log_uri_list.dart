import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'system_log_uri.dart';

part 'system_log_uri_list.g.dart';

@JsonSerializable()
class SystemLogUriList {
  @JsonKey(name: 'SystemLog', fromJson: _fromJson)
  final List<SystemLogUri>? systemLogs;

  SystemLogUriList({required this.systemLogs});

  factory SystemLogUriList.fromJson(Map<String, dynamic> json) =>
      _$SystemLogUriListFromJson(json);

  Map<String, dynamic> toJson() => _$SystemLogUriListToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<SystemLogUri> _fromJson(dynamic json) =>
      OnvifUtil.jsonList<SystemLogUri>(
        json,
        (json) => SystemLogUri.fromJson(json as Map<String, dynamic>),
      );
}
