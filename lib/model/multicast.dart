import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'multicast.g.dart';

@JsonSerializable()

///Defines the multicast settings that could be used for video streaming.
class Multicast {
  @JsonKey(name: 'Address')

  ///The multicast address (if this address is set to 0 no multicast streaming
  ///is enaled)
  final Address address;

  @JsonKey(name: 'Port')
  final dynamic xmlPort;

  @JsonKey(name: 'TTL')
  final dynamic xmlTtl;

  @JsonKey(name: 'AutoStart')
  final dynamic xmlAutoStart;

  ///The RTP mutlicast destination port. A device may support RTCP. In this case
  ///the port value shall be even to allow the corresponding RTCP stream to be
  ///mapped to the next higher (odd) destination port number as defined in the
  ///RTSP specification.
  int get port => int.parse(xmlPort['\$']);

  ///In case of IPv6 the TTL value is assumed as the hop limit. Note that for
  ///IPV6 and administratively scoped IPv4 multicast the primary use for hop
  ///limit / TTL is to prevent packets from (endlessly) circulating and not
  ///limiting scope. In these cases the address contains the scope.
  int get ttl => int.parse(xmlTtl['\$']);

  ///Read only property signalling that streaming is persistant. Use the methods
  ///[startMulticastStreaming] and [stopMulticastStreaming] to switch its state.
  bool get autoStart => xmlAutoStart['\$'].toLowerCase() == 'true';

  Multicast(this.address, this.xmlPort, this.xmlTtl, this.xmlAutoStart);

  factory Multicast.fromJson(Map<String, dynamic> json) =>
      _$MulticastFromJson(json);

  Map<String, dynamic> toJson() => _$MulticastToJson(this);
}
