import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'ipaddress_filter.dart';

part 'get_ipaddress_filter_response.g.dart';

@JsonSerializable()
class GetIpAddressFilterResponse {
  @JsonKey(name: 'IPAddressFilter')
  IpAddressFilter ipAddressFilter;

  GetIpAddressFilterResponse({required this.ipAddressFilter});

  factory GetIpAddressFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIpAddressFilterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetIpAddressFilterResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
