import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_stream_uri_response.g.dart';

/// This operation requests a URI that can be used to initiate a live media
/// stream using RTSP as the control protocol. The returned URI shall remain
/// valid indefinitely even if the profile is changed. The ValidUntilConnect,
/// ValidUntilReboot and Timeout Parameter shall be set accordingly
/// (ValidUntilConnect=false, ValidUntilReboot=false, timeout=PT0S).
///
/// The correct syntax for the StreamSetup element for these media stream setups
/// defined in 5.1.1 of the streaming specification are as follows:
/// RTP unicast over UDP: StreamType = "RTP_unicast", TransportProtocol = "UDP"
/// RTP over RTSP over HTTP over TCP: StreamType = "RTP_unicast",
/// TransportProtocol = "HTTP"
/// RTP over RTSP over TCP: StreamType = "RTP_unicast", TransportProtocol =
/// "RTSP"
///
/// If a multicast stream is requested at least one of
/// VideoEncoderConfiguration, AudioEncoderConfiguration and
/// MetadataConfiguration shall have a valid multicast setting.
///
/// For full compatibility with other ONVIF services a device should not
/// generate Uris longer than 128 octets.
@JsonSerializable()
class GetStreamUriResponse {
  @JsonKey(name: 'Uri', fromJson: OnvifUtil.stringMappedFromXml)
  final String uri;

  GetStreamUriResponse({required this.uri});

  factory GetStreamUriResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStreamUriResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetStreamUriResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
