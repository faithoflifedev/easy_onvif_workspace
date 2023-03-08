import 'package:easy_onvif/media1.dart';
import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/soap.dart' as soap;
import 'package:loggy/loggy.dart';

class Media1 with UiLoggy {
  final soap.Transport transport;

  final Uri uri;

  Media1({
    required this.transport,
    required this.uri,
  });

  /// This command lists all available physical audio inputs of the device.
  Future<List<AudioSource>> getAudioSources() async {
    loggy.debug('getAudioSources');

    final envelope = await transport.sendRequest(
        uri, transport.securedEnvelope(soap.MediaRequest.getAudioSources()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetAudioSourcesResponse.fromJson(envelope.body.response!)
        .audioSources;
  }

  /// The GetMetadataConfiguration command fetches the metadata configuration if
  /// the metadata token is known.
  Future<MetadataConfiguration> getMetadataConfiguration(
      String configurationToken) async {
    loggy.debug('getMetadataConfiguration');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.MediaRequest.getMetadataConfiguration(configurationToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetMetadataConfigurationResponse.fromJson(envelope.body.response!)
        .configuration;
  }

  /// This operation lists all existing metadata configurations. The client need
  /// not know anything apriori about the metadata in order to use the command.
  Future<List<MetadataConfiguration>> getMetadataConfigurations({
    String? configurationToken,
    String? profileToken,
  }) async {
    loggy.debug('getMetadataConfigurations');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(soap.MediaRequest.getMetadataConfigurations(
          configurationToken: configurationToken,
          profileToken: profileToken,
        )));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetMetadataConfigurationsResponse.fromJson(envelope.body.response!)
        .configurations;
  }

  /// If the profile token is already known, a profile can be fetched through
  /// the [getProfile] command.
  Future<Profile> getProfile(String profileToken) async {
    loggy.debug('getProfile');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.MediaRequest.getProfile(profileToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetProfileResponse.fromJson(envelope.body.response!).profile;
  }

  /// Any endpoint can ask for the existing media1 profiles of a device using the
  /// [getProfiles] command. Pre-configured or dynamically configured profiles
  /// can be retrieved using this command. This command lists all configured
  /// profiles in a device. The client does not need to know the media1 profile
  /// in order to use the command.
  Future<List<Profile>> getProfiles() async {
    loggy.debug('getProfiles');

    final envelope = await transport.sendRequest(
        uri, transport.securedEnvelope(soap.MediaRequest.getProfiles()));

    final success = envelope.body.response?.containsKey('Profiles') ?? false;

    if (!success) {
      throw Exception(
          envelope.body.hasFault ? envelope.body.fault.toString() : null);
    }

    return GetProfilesResponse.fromJson(envelope.body.response!).profiles;
  }

  /// Returns the capabilities of the media1 service. The result is returned in a
  /// typed answer.
  Future<Capabilities1> getServiceCapabilities() async {
    loggy.debug('getServiceCapabilities');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.MediaRequest.getServiceCapabilities()));

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
  /// will always be JPEG regardless of the encoding setting in the media1
  /// profile. The Jpeg settings (like resolution or quality) may be taken from
  /// the profile if suitable. The provided image will be updated automatically
  /// and independent from calls to [getSnapshotUri].
  Future<MediaUri> getSnapshotUri(String profileToken) async {
    loggy.debug('getSnapshotUri');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.MediaRequest.getSnapshotUri(profileToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetSnapshotUriResponse.fromJson(envelope.body.response!).mediaUri;
  }

  /// This operation requests a [Uri] that can be used to initiate a live media1
  /// stream using RTSP as the control protocol. The returned URI shall remain
  /// valid indefinitely even if the profile is changed. The
  /// [validUntilConnect], [validUntilReboot] and [timeout] Parameter shall be set
  /// accordingly (validUntilConnect=false, validUntilReboot=false,
  /// timeout=PT0S).
  ///
  /// The correct syntax for the StreamSetup element for these media1 stream
  /// setups defined in 5.1.1 of the streaming specification are as follows:
  ///  1. RTP unicast over UDP: StreamType = "RTP-Unicast", TransportProtocol =
  ///  "UDP"
  ///  2. RTP over RTSP over HTTP over TCP: StreamType = "RTP-Unicast",
  ///  TransportProtocol = "HTTP"
  ///  3. RTP over RTSP over TCP: StreamType = "RTP-Unicast",
  ///  TransportProtocol = "RTSP"
  ///
  /// If a multicast stream is requested at least one of
  /// videoEncoderConfiguration, audioEncoderConfiguration and
  /// metadataConfiguration shall have a valid multicast setting.
  ///
  /// For full compatibility with other ONVIF services a device should not
  /// generate Uris longer than 128 octets.
  Future<MediaUri> getStreamUri(
    String profileToken, {
    required StreamSetup streamSetup,
  }) async {
    loggy.debug('getStreamUri');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(soap.MediaRequest.getStreamUri(profileToken,
            streamSetup: streamSetup)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetStreamUriResponse.fromJson(envelope.body.response!).mediaUri;
  }

  /// This command lists all available physical video inputs of the device.
  Future<List<VideoSource>> getVideoSources() async {
    loggy.debug('getVideoSources');

    final envelope = await transport.sendRequest(
        uri, transport.securedEnvelope(soap.MediaRequest.getVideoSources()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetVideoSourcesResponse.fromJson(envelope.body.response!)
        .videoSources;
  }

  /// This command starts multicast streaming using a specified media1 profile of
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
            soap.MediaRequest.startMulticastStreaming(profileToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }

  /// This command stop multicast streaming using a specified media1 profile of a
  /// device
  Future<bool> stopMulticastStreaming(String profileToken) async {
    loggy.debug('stopMulticastStreaming');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.MediaRequest.stopMulticastStreaming(profileToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }
}
