import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'multicast.g.dart';

@JsonSerializable()
class Multicast {
  @JsonKey(name: 'Address')
  final Address address;

  @JsonKey(name: 'Port')
  final dynamic xmlPort;

  @JsonKey(name: 'TTL')
  final dynamic xmlTtl;

  @JsonKey(name: 'AutoStart')
  final dynamic xmlAutoStart;

  int get port => int.parse(xmlPort['\$']);

  int get ttl => int.parse(xmlTtl['\$']);

  bool get autoStart => xmlAutoStart['\$'].toLowerCase() == 'true';

  Multicast(this.address, this.xmlPort, this.xmlTtl, this.xmlAutoStart);

  factory Multicast.fromJson(Map<String, dynamic> json) =>
      _$MulticastFromJson(json);

  Map<String, dynamic> toJson() => _$MulticastToJson(this);
}
