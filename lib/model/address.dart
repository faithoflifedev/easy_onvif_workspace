import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  @JsonKey(name: 'Type')
  final dynamic xmlType;

  @JsonKey(name: 'IPv4Address')
  final dynamic xmlIp4Address;

  String get type => xmlType['\$'];

  String get ip4Address => xmlIp4Address['\$'];

  Address(this.xmlType, this.xmlIp4Address);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
