import 'package:easy_onvif/media1.dart' show StreamSetup;
import 'package:easy_onvif/replay.dart';
import 'package:easy_onvif/soap.dart' as soap;
import 'package:loggy/loggy.dart';

class Replay with UiLoggy {
  final soap.Transport transport;

  final Uri uri;

  Replay({
    required this.transport,
    required this.uri,
  });

  /// Returns the current configuration of the replay service. This operation is
  /// mandatory.
  Future<ReplayConfiguration> getReplayConfiguration() async {
    loggy.debug('getReplayConfiguration');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.ReplayRequest.getReplayConfiguration()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetReplayConfigurationResponse.fromJson(envelope.body.response!)
        .configuration;
  }

  /// Requests a URI that can be used to initiate playback of a recorded stream
  /// using RTSP as the control protocol. The URI is valid only as it is
  /// specified in the response. A device supporting the Replay Service shall
  /// support the GetReplayUri command.
  Future<String> getReplayUri(
    String recordingToken, {
    required StreamSetup streamSetup,
  }) async {
    loggy.debug('getReplayUri');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(soap.ReplayRequest.getReplayUri(
          recordingToken,
          streamSetup: streamSetup,
        )));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetReplayUriResponse.fromJson(envelope.body.response!).uri;
  }

  /// Returns the capabilities of the replay service. The result is returned in
  /// a typed answer.
  Future<Capabilities> getServiceCapabilities() async {
    loggy.debug('getServiceCapabilities');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.ReplayRequest.getServiceCapabilities()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
        .capabilities;
  }

  /// Changes the current configuration of the replay service. This operation is
  /// mandatory.
  Future<bool> setReplayConfiguration(ReplayConfiguration configuration) async {
    loggy.debug('getReplayConfiguration');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.ReplayRequest.setReplayConfiguration(configuration)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }
}
