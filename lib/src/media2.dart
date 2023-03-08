import 'package:easy_onvif/media2.dart';
import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/soap.dart' as soap;
import 'package:loggy/loggy.dart';

class Media2 with UiLoggy {
  final soap.Transport transport;
  final Uri uri;

  Media2({
    required this.transport,
    required this.uri,
  });

  Future<MetadataConfigurationOptions> getMetadataConfigurationOptions({
    String? configurationToken,
    String? profileToken,
  }) async {
    loggy.debug('getMetadataConfigurationOptions');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.Media2Request.getMetadataConfigurationOptions(
                configurationToken: configurationToken,
                profileToken: profileToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetMetadataConfigurationOptionsResponse.fromJson(
            envelope.body.response!)
        .options;
  }

  Future<List<MetadataConfiguration>> getMetadataConfigurations({
    String? configurationToken,
    String? profileToken,
  }) async {
    loggy.debug('getMetadataConfigurations');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(soap.Media2Request.getMetadataConfigurations(
            configurationToken: configurationToken,
            profileToken: profileToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetMetadataConfigurationsResponse.fromJson(envelope.body.response!)
        .configurations;
  }

  /// Retrieve the profile with the specified token or all defined media
  /// profiles.
  /// - If no Type is provided the returned profiles shall contain no
  ///   configuration information.
  /// - If a single Type with value 'All' is provided the returned profiles
  ///   shall include all associated configurations.
  /// - Otherwise the requested list of configurations shall for each profile
  ///   include the configurations present as Type.
  ///
  /// [referenceToken] - optional;\
  /// Optional token of the requested profile.
  /// [type] - optional, unbounded; List<String>
  /// The types shall be provided as defined by tr2:ConfigurationEnumeration.
  Future<List<MediaProfile>> getProfiles({
    String? referenceToken,
    List<String>? type,
  }) async {
    loggy.debug('getProfiles');

    final envelope = await transport.sendRequest(
        uri, transport.securedEnvelope(soap.Media2Request.getProfiles()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetProfilesResponse.fromJson(envelope.body.response!).profiles;
  }

  /// Returns the capabilities of the media service. The result is returned in a
  /// typed answer.
  Future<Capabilities2> getServiceCapabilities() async {
    loggy.debug('getServiceCapabilities');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.Media2Request.getServiceCapabilities()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
        .capabilities;
  }

  /// A client uses the [getSnapshotUri] command to obtain a JPEG snapshot from
  /// the device. The returned URI shall remain valid indefinitely even if the
  /// profile is changed. The [validUntilConnect], [validUntilReboot] and
  /// [timeout] parameter shall be set accordingly (validUntilConnect=false,
  /// validUntilReboot=false, timeout=PT0S). The URI can be used for
  /// acquiring a JPEG image through a HTTP GET operation. The image encoding
  /// will always be JPEG regardless of the encoding setting in the media
  /// profile. The Jpeg settings (like resolution or quality) may be taken from
  /// the profile if suitable. The provided image will be updated automatically
  /// and independent from calls to [getSnapshotUri].
  ///
  /// [profileToken] - the ProfileToken element indicates the media profile to
  /// use and will define the source and dimensions of the snapshot.
  Future<String> getSnapshotUri(String profileToken) async {
    loggy.debug('getSnapshotUri');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.Media2Request.getSnapshotUri(profileToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetSnapshotUriResponse.fromJson(envelope.body.response!).uri;
  }

  /// This operation requests a [Uri] that can be used to initiate a live media
  /// stream using RTSP as the control protocol. The returned URI shall remain
  /// valid indefinitely even if the profile is changed. The
  /// [validUntilConnect], [validUntilReboot] and Timeout Parameter shall be set
  /// accordingly (validUntilConnect=false, validUntilReboot=false,
  /// timeout=PT0S).
  ///
  /// The correct syntax for the StreamSetup element for these media stream
  /// setups defined in 5.1.1 of the streaming specification are as follows:
  ///  RTP unicast over UDP: StreamType = "RTP-Unicast", TransportProtocol =
  /// "UDP"   ///  RTP over RTSP over HTTP over TCP: StreamType = "RTP-Unicast",
  /// TransportProtocol = "HTTP"   ///  RTP over RTSP over TCP: StreamType =
  /// "RTP-Unicast", TransportProtocol = "RTSP"
  ///
  /// If a multicast stream is requested at least one of
  /// videoEncoderConfiguration, audioEncoderConfiguration and
  /// metadataConfiguration shall have a valid multicast setting.
  ///
  /// For full compatibility with other ONVIF services a device should not
  /// generate Uris longer than 128 octets.
  Future<String> getStreamUri(
    String profileToken, {
    String streamType = 'RTP-Multicast',
    String protocol = 'RTSP',
  }) async {
    loggy.debug('getStreamUri');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(soap.Media2Request.getStreamUri(
          profileToken,
          streamType: streamType,
          transportProtocol: protocol,
        )));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetStreamUriResponse.fromJson(envelope.body.response!).uri;
  }

  /// The GetVideoEncoderInstances command can be used to request the minimum
  /// number of guaranteed video encoder instances (applications) per Video
  /// Source Configuration.
  Future<Info> getVideoEncoderInstances(String configurationToken) async {
    loggy.debug('getVideoEncoderInstances');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.Media2Request.getVideoEncoderInstances(configurationToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetVideoEncoderInstancesResponse.fromJson(envelope.body.response!)
        .info;
  }

  /// This command starts multicast streaming using a specified media profile of
  /// a device. Streaming continues until StopMulticastStreaming is called for
  /// the same Profile. The streaming shall continue after a reboot of the
  /// device until a StopMulticastStreaming request is received. The multicast
  /// address, port and TTL are configured in the VideoEncoderConfiguration,
  /// AudioEncoderConfiguration and MetadataConfiguration respectively.
  Future<bool> startMulticastStreaming(String profileToken) async {
    loggy.debug('startMulticastStreaming');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.Media2Request.startMulticastStreaming(profileToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }

  /// This command stop multicast streaming using a specified media profile of a
  /// device
  ///
  /// [profileToken] - contains the token of the Profile that is used to define
  /// the multicast stream.
  Future<bool> stopMulticastStreaming(String profileToken) async {
    loggy.debug('stopMulticastStreaming');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.Media2Request.stopMulticastStreaming(profileToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }
    return true;
  }
}
