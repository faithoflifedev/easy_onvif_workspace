import 'package:easy_onvif/thermal.dart';
import 'package:easy_onvif/soap.dart' as soap;
import 'package:loggy/loggy.dart';

class Thermal with UiLoggy {
  final soap.Transport transport;

  final Uri uri;

  Thermal({
    required this.transport,
    required this.uri,
  });

  /// Gets the Thermal Configuration for the requested VideoSource.
  Future<ThermalConfiguration> getConfiguration(String videoSourceToken) async {
    loggy.debug('GetConfigurations');

    final envelope = await transport.sendRequest(
      uri,
      transport.securedEnvelope(
          soap.ThermalRequest.getConfiguration(videoSourceToken)),
    );

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetThermalConfigurationResponse.fromJson(envelope.body.response!)
        .configuration;
  }

  /// Gets the Thermal Configuration for all thermal VideoSources of the Device.
  Future<List<ThermalConfiguration>> getConfigurations() async {
    loggy.debug('GetConfigurations');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.ThermalRequest.getConfigurations()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetThermalConfigurationsResponse.fromJson(envelope.body.response!)
        .configurations;
  }
}
