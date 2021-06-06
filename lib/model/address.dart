import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()

///The multicast address (if this address is set to 0 no multicast streaming is
///enaled)
class Address {
  @JsonKey(name: 'Type')
  final dynamic xmlType;

  @JsonKey(name: 'IPv4Address')
  final dynamic xmlIp4Address;

  ///Indicates if the address is an IPv4 or IPv6 address.
  ///- enum { 'IPv4', 'IPv6' }
  String get type => xmlType['\$'];

  ///IPv4 address.
  String get ip4Address => xmlIp4Address['\$'];

  Address(this.xmlType, this.xmlIp4Address);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
