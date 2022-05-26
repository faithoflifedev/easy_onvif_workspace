import 'dart:convert';

import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()

///The multicast address (if this address is set to 0 no multicast streaming is
///enaled)
class Address {
  ///Indicates if the address is an IPv4 or IPv6 address.
  ///- enum { 'IPv4', 'IPv6' }
  @JsonKey(name: 'Type', fromJson: OnvifUtil.mappedToString)
  final String type;

  ///IPv4 address.
  @JsonKey(name: 'IPv4Address', fromJson: OnvifUtil.nullableMappedToString)
  final String? ip4Address;

  Address(this.type, this.ip4Address);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  String toString() => json.encode(toJson());
}
