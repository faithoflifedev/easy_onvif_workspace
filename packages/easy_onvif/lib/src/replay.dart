import 'package:easy_onvif/media1.dart' show StreamSetup;
import 'package:easy_onvif/replay.dart';
import 'package:easy_onvif/soap.dart' as soap;

import 'operation.dart';

typedef ReplayRequest = soap.ReplayRequest;

/// The replay service provides a mechanism for replay of stored video, audio
/// and metadata. This mechanism may also be used to download data from the
/// storage device so that export functionality can be provided.
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
class Replay extends Operation {
  Replay({required super.transport, required super.uri});

  /// Returns the current configuration of the replay service. This operation is
  /// mandatory.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<ReplayConfiguration> getReplayConfiguration() async {
    loggy.debug('getReplayConfiguration');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(request: ReplayRequest.getReplayConfiguration()),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetReplayConfigurationResponse.fromJson(
      responseEnvelope.body.response!,
    ).configuration;
  }

  /// Requests a URI that can be used to initiate playback of a recorded stream
  /// using RTSP as the control protocol. The URI is valid only as it is
  /// specified in the response. A device supporting the Replay Service shall
  /// support the GetReplayUri command.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<String> getReplayUri(
    String recordingToken, {
    required StreamSetup streamSetup,
  }) async {
    loggy.debug('getReplayUri');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(
        request: ReplayRequest.getReplayUri(
          recordingToken,
          streamSetup: streamSetup,
        ),
      ),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetReplayUriResponse.fromJson(responseEnvelope.body.response!).uri;
  }

  /// Returns the capabilities of the replay service. The result is returned in
  /// a typed answer.
  ///
  /// ACCESS CLASS: PRE_AUTH
  Future<Capabilities> getServiceCapabilities() async {
    loggy.debug('getServiceCapabilities');

    final responseEnvelope = await transport.request(
      uri,
      soap.Body(request: ReplayRequest.getServiceCapabilities()),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetServiceCapabilitiesResponse.fromJson(
      responseEnvelope.body.response!,
    ).capabilities;
  }

  /// Changes the current configuration of the replay service. This operation is
  /// mandatory.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<bool> setReplayConfiguration(ReplayConfiguration configuration) async {
    loggy.debug('getReplayConfiguration');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(request: ReplayRequest.setReplayConfiguration(configuration)),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return true;
  }
}
