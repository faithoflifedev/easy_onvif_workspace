import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'ptz_configuration_options.dart';

part 'get_configuration_options_response.g.dart';

@JsonSerializable()
class GetConfigurationOptionsResponse {
  @JsonKey(name: 'PTZConfigurationOptions')
  final PtzConfigurationOptions ptzConfigurationOptions;

  GetConfigurationOptionsResponse({required this.ptzConfigurationOptions});

  factory GetConfigurationOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConfigurationOptionsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetConfigurationOptionsResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
