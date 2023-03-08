import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'hostname_information.dart';

part 'get_hostname_response.g.dart';

@JsonSerializable()
class GetHostnameResponse {
  @JsonKey(name: 'HostnameInformation')
  HostnameInformation hostnameInformation;

  GetHostnameResponse({
    required this.hostnameInformation,
  });

  factory GetHostnameResponse.fromJson(Map<String, dynamic> json) =>
      _$GetHostnameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetHostnameResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
