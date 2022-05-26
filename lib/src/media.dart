// import 'package:easy_onvif/model/envelope.dart';
import 'package:easy_onvif/model/configuration.dart';
import 'package:easy_onvif/onvif.dart';

class Media {
  final Onvif onvif;
  final String uri;

  Media({required this.onvif, required this.uri});

  ///This command lists all available physical audio inputs of the device.
  Future<List<AudioSource>> getAudioSources() async {
    // Future<void> getAudioSources() async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.audioSources()));

    if (envelope.body.audioSourcesResponse == null) throw Exception();

    return envelope.body.audioSourcesResponse!.audioSources;
  }

  ///This operation lists all existing metadata configurations. The client need
  ///not know anything apriori about the metadata in order to use the command.
  Future<List<Configuration>> getMetadataConfigurations() async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.metadataConfigurations()));

    if (envelope.body.metadataConfigurationsResponse == null) throw Exception();

    return envelope.body.metadataConfigurationsResponse!.configurations;
  }

  ///Any endpoint can ask for the existing media profiles of a device using the
  ///[getProfiles] command. Pre-configured or dynamically configured profiles
  ///can be retrieved using this command. This command lists all configured
  ///profiles in a device. The client does not need to know the media profile in
  ///order to use the command.
  Future<List<Profile>> getProfiles() async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.profiles()));

    if (envelope.body.profilesResponse == null) throw Exception();

    return envelope.body.profilesResponse!.profiles;
  }

  ///Returns the capabilities of the media service. The result is returned in a
  ///typed answer.
  Future<void> getServiceCapabilities() async {
    throw UnimplementedError();
  }

  ///A client uses the [getSnapshotUri] command to obtain a JPEG snapshot from
  ///the device. The returned URI shall remain valid indefinitely even if the
  ///profile is changed. The [validUntilConnect], [validUntilReboot] and
  ///[timeout] parameter shall be set accordingly (validUntilConnect=false,
  ///validUntilReboot=false, timeout=PT0S). The URI can be used for
  ///acquiring a JPEG image through a HTTP GET operation. The image encoding
  ///will always be JPEG regardless of the encoding setting in the media
  ///profile. The Jpeg settings (like resolution or quality) may be taken from
  ///the profile if suitable. The provided image will be updated automatically
  ///and independent from calls to [getSnapshotUri].
  Future<MediaUri> getSnapshotUri(String profileToken,
      {bool validUntilConnect = false,
      bool validUntilReboot = false,
      String timeout = 'PT0S'}) async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.snapshotUri(profileToken)));

    if (envelope.body.snapshotUriResponse == null) throw Exception();

    return envelope.body.snapshotUriResponse!.mediaUri;
  }

  ///This operation requests a [Uri] that can be used to initiate a live media
  ///stream using RTSP as the control protocol. The returned URI shall remain
  ///valid indefinitely even if the profile is changed. The [validUntilConnect],
  ///[validUntilReboot] and Timeout Parameter shall be set accordingly (
  ///validUntilConnect=false, validUntilReboot=false, timeout=PT0S).
  ///
  ///The correct syntax for the StreamSetup element for these media stream
  ///setups defined in 5.1.1 of the streaming specification are as follows:
  ///  RTP unicast over UDP: StreamType = "RTP-Unicast", TransportProtocol =
  /// "UDP"   ///  RTP over RTSP over HTTP over TCP: StreamType = "RTP-Unicast",
  /// TransportProtocol = "HTTP"   ///  RTP over RTSP over TCP: StreamType =
  /// "RTP-Unicast", TransportProtocol = "RTSP"
  ///
  ///If a multicast stream is requested at least one of
  ///videoEncoderConfiguration, audioEncoderConfiguration and
  ///metadataConfiguration shall have a valid multicast setting.
  ///
  ///For full compatibility with other ONVIF services a device should not
  ///generate Uris longer than 128 octets.
  Future<MediaUri> getStreamUri(String profileToken,
      {String streamType = 'RTP-Unicast',
      String transportProtocol = 'RTSP',
      bool validUntilConnect = false,
      bool validUntilReboot = false,
      String timeout = 'PT0S'}) async {
    final envelope = await Soap.retrieveEnvlope(
        uri,
        onvif.secureRequest(SoapRequest.streamUri(profileToken,
            streamType: streamType, transportProtocol: transportProtocol)));

    if (envelope.body.streamUriResponse == null) throw Exception();

    return envelope.body.streamUriResponse!.mediaUri;
  }

  ///This command lists all available physical video inputs of the device.
  Future<List<VideoSource>> getVideoSources() async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.videoSources()));

    if (envelope.body.videoSourcesResponse == null) throw Exception();

    return envelope.body.videoSourcesResponse!.videoSources;
  }

  ///This command starts multicast streaming using a specified media profile of
  ///a device. Streaming continues until StopMulticastStreaming is called for
  ///the same Profile. The streaming shall continue after a reboot of the device
  ///until a StopMulticastStreaming request is received. The multicast address,
  ///port and TTL are configured in the VideoEncoderConfiguration,
  ///AudioEncoderConfiguration and MetadataConfiguration respectively.
  Future<void> startMulticastStreaming() async {
    await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.startMulticastStreaming()));
  }

  ///This command stop multicast streaming using a specified media profile of a
  ///device
  Future<void> stopMulticastStreaming() async {
    await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.stopMulticastStreaming()));
  }
}
