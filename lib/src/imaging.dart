import 'package:easy_onvif/imaging.dart';
import 'package:loggy/loggy.dart';
import 'package:easy_onvif/soap.dart' as soap;

class Imaging with UiLoggy {
  final soap.Transport transport;

  final Uri uri;

  Imaging({
    required this.transport,
    required this.uri,
  });

  /// Via this command the last Imaging Preset applied can be requested. If the
  /// camera configuration does not match any of the existing Imaging Presets,
  /// the output of GetCurrentPreset shall be Empty. GetCurrentPreset shall
  /// return 0 if Imaging Presets are not supported by the Video Source.
  Future<ImagingPreset> getCurrentPreset(String videoSourceToken,
      {int? limit = 100}) async {
    loggy.debug('getCurrentPreset');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.ImagingRequest.getCurrentPreset(videoSourceToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetCurrentPresetResponse.fromJson(envelope.body.response!).preset;
  }

  /// Via this command the list of available Imaging Presets can be requested.
  Future<List<ImagingPreset>> getPresets(String videoSourceToken,
      {int? limit = 100}) async {
    loggy.debug('getPresets');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.ImagingRequest.getPresets(videoSourceToken)));

    if (envelope.body.response == null) throw Exception();

    final presets =
        GetPresetsResponse.fromJson(envelope.body.response!).presets;

    limit = (limit! > presets.length) ? presets.length : limit;

    return GetPresetsResponse.fromJson(envelope.body.response!)
        .presets
        .sublist(0, limit);
  }

  /// Returns the capabilities of the imaging service. The result is returned in
  /// a typed answer.
  Future<Capabilities> getServiceCapabilities() async {
    loggy.debug('getServiceCapabilities');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.ImagingRequest.getServiceCapabilities()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
        .capabilities;
  }

  /// Via this command the current status of the Move operation can be requested.
  /// Supported for this command is available if the support for the Move
  /// operation is signalled via GetMoveOptions.
  Future<ImagingStatus20> getStatus(String videoSourceToken) async {
    loggy.debug('getStatus');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.ImagingRequest.getStatus(videoSourceToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetStatusResponse.fromJson(envelope.body.response!).imagingStatus20;
  }
}
