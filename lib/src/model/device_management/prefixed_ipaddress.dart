import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'prefixed_ipaddress.g.dart';

@JsonSerializable()
class PrefixedIpAddress {
  @JsonKey(name: 'PrefixLength')
  final int prefixLength;

  PrefixedIpAddress({
    required this.prefixLength,
  });

  factory PrefixedIpAddress.fromJson(Map<String, dynamic> json) =>
      _$PrefixedIpAddressFromJson(json);

  Map<String, dynamic> toJson() => _$PrefixedIpAddressToJson(this);

  @override
  String toString() => json.encode(toJson());
}
