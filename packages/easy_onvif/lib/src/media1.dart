import 'package:easy_onvif/media1.dart';
import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/soap.dart' as soap;

import 'operation.dart';

typedef MediaRequest = soap.MediaRequest;

/// Real-time video and audio streaming configurations are controlled using
/// media profiles. A media profile maps a video and/or audio source to a video
/// and/or an audio encoder, PTZ and analytics configurations.
///
/// Default Access Policy Definition
/// | | Administrator | Operator | User | Anonymous |
/// | PRE_AUTH | X | X | X | X |
/// | READ_SYSTEM | X | X | X | |
/// | READ_SYSTEM_SENSITIVE | X | X | | |
/// | READ_SYSTEM_SECRET | X | | | |
/// | WRITE_SYSTEM | X | | | |
/// | UNRECOVERABLE | X | | | |
/// | READ_MEDIA | X | X | X | |
/// | ACTUATE | X | X | | |
class Media1 extends Operation {
  Media1({required super.transport, required super.uri});

  /// This command lists all available physical audio inputs of the device.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<List<AudioSource>> getAudioSources() async {
    loggy.debug('getAudioSources');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(request: MediaRequest.getAudioSources()),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetAudioSourcesResponse.fromJson(
      responseEnvelope.body.response!,
    ).audioSources;
  }

  /// The GetMetadataConfiguration command fetches the metadata configuration if
  /// the metadata token is known.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<MetadataConfiguration> getMetadataConfiguration(
    String configurationToken,
  ) async {
    loggy.debug('getMetadataConfiguration');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(
        request: MediaRequest.getMetadataConfiguration(configurationToken),
      ),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetMetadataConfigurationResponse.fromJson(
      responseEnvelope.body.response!,
    ).configuration;
  }

  /// This operation lists all existing metadata configurations. The client need
  /// not know anything apriori about the metadata in order to use the command.
  ///
  /// Access Class: READ_MEDIA
  Future<List<MetadataConfiguration>> getMetadataConfigurations({
    String? configurationToken,
    String? profileToken,
  }) async {
    loggy.debug('getMetadataConfigurations');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(
        request: MediaRequest.getMetadataConfigurations(
          configurationToken: configurationToken,
          profileToken: profileToken,
        ),
      ),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetMetadataConfigurationsResponse.fromJson(
      responseEnvelope.body.response!,
    ).configurations;
  }

  /// If the profile token is already known, a profile can be fetched through
  /// the [getProfile] command.
  ///
  /// Access Class: READ_MEDIA
  Future<Profile> getProfile(String profileToken) async {
    loggy.debug('getProfile');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(request: MediaRequest.getProfile(profileToken)),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetProfileResponse.fromJson(responseEnvelope.body.response!).profile;
  }

  /// Any endpoint can ask for the existing media1 profiles of a device using the
  /// [getProfiles] command. Pre-configured or dynamically configured profiles
  /// can be retrieved using this command. This command lists all configured
  /// profiles in a device. The client does not need to know the media1 profile
  /// in order to use the command.
  ///
  /// Access Class: READ_MEDIA
  Future<List<Profile>> getProfiles() async {
    loggy.debug('getProfiles');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(request: MediaRequest.getProfiles()),
    );

    final success =
        responseEnvelope.body.response?.containsKey('Profiles') ?? false;

    if (!success) {
      throw Exception(
        responseEnvelope.body.hasFault
            ? responseEnvelope.body.fault.toString()
            : null,
      );
    }

    return GetProfilesResponse.fromJson(
      responseEnvelope.body.response!,
    ).profiles;
  }

  /// Returns the capabilities of the media1 service. The result is returned in a
  /// typed answer.
  ///
  /// Access Class: PRE_AUTH
  Future<Capabilities1> getServiceCapabilities() async {
    loggy.debug('getServiceCapabilities');

    final responseEnvelope = await transport.request(
      uri,
      soap.Body(request: MediaRequest.getServiceCapabilities()),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetServiceCapabilitiesResponse.fromJson(
      responseEnvelope.body.response!,
    ).capabilities;
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
  ///
  /// Access Class: READ_MEDIA
  Future<MediaUri> getSnapshotUri(String profileToken) async {
    loggy.debug('getSnapshotUri');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(request: MediaRequest.getSnapshotUri(profileToken)),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetSnapshotUriResponse.fromJson(
      responseEnvelope.body.response!,
    ).mediaUri;
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
  ///
  /// Access Class: READ_MEDIA
  Future<MediaUri> getStreamUri(
    String profileToken, {
    required StreamSetup streamSetup,
  }) async {
    loggy.debug('getStreamUri');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(
        request: MediaRequest.getStreamUri(
          profileToken,
          streamSetup: streamSetup,
        ),
      ),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetStreamUriResponse.fromJson(
      responseEnvelope.body.response!,
    ).mediaUri;
  }

  /// This command lists all available physical video inputs of the device.
  ///
  /// Access Class: READ_MEDIA
  Future<List<VideoSource>> getVideoSources() async {
    loggy.debug('getVideoSources');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(request: MediaRequest.getVideoSources()),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetVideoSourcesResponse.fromJson(
      responseEnvelope.body.response!,
    ).videoSources;
  }

  /// This command starts multicast streaming using a specified media1 profile of
  /// a device. Streaming continues until StopMulticastStreaming is called for
  /// the same Profile. The streaming shall continue after a reboot of the
  /// device until a StopMulticastStreaming request is received. The multicast
  /// address, port and TTL are configured in the VideoEncoderConfiguration,
  /// AudioEncoderConfiguration and MetadataConfiguration respectively.
  ///
  /// Access Class: ACTUATE
  Future<bool> startMulticastStreaming(String profileToken) async {
    loggy.debug('startMulticastStreaming');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(request: MediaRequest.startMulticastStreaming(profileToken)),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return true;
  }

  /// This command stop multicast streaming using a specified media1 profile of a
  /// device
  Future<bool> stopMulticastStreaming(String profileToken) async {
    loggy.debug('stopMulticastStreaming');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(request: MediaRequest.stopMulticastStreaming(profileToken)),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return true;
  }
}
