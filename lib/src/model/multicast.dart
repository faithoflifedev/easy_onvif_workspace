import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'multicast.g.dart';

@JsonSerializable()

///Defines the multicast settings that could be used for video streaming.
class Multicast {
  ///The multicast address (if this address is set to 0 no multicast streaming
  ///is enaled)
  @JsonKey(name: 'Address')
  final Address address;

  ///The RTP mutlicast destination port. A device may support RTCP. In this case
  ///the port value shall be even to allow the corresponding RTCP stream to be
  ///mapped to the next higher (odd) destination port number as defined in the
  ///RTSP specification.
  @JsonKey(name: 'Port', fromJson: OnvifUtil.mappedToInt)
  final int port;

  ///In case of IPv6 the TTL value is assumed as the hop limit. Note that for
  ///IPV6 and administratively scoped IPv4 multicast the primary use for hop
  ///limit / TTL is to prevent packets from (endlessly) circulating and not
  ///limiting scope. In these cases the address contains the scope.
  @JsonKey(name: 'TTL', fromJson: OnvifUtil.mappedToInt)
  final int ttl;

  ///Read only property signalling that streaming is persistant. Use the methods
  ///StartMulticastStreaming and StopMulticastStreaming to switch its state.
  @JsonKey(name: 'AutoStart', fromJson: OnvifUtil.mappedToBool)
  final bool autoStart;

  Multicast(
      {required this.address,
      required this.port,
      required this.ttl,
      required this.autoStart});

  factory Multicast.fromJson(Map<String, dynamic> json) =>
      _$MulticastFromJson(json);

  Map<String, dynamic> toJson() => _$MulticastToJson(this);
}
