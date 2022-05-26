import 'package:easy_onvif/onvif.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';

void main() {
  test('metadataConfigurationsResponse is not null when doc parsed', () {
    final response =
        File('xml/GetMetadataConfigurationsResponse.xml').readAsStringSync();

    final envelope = Envelope.fromXml(response);

    var configs = envelope.body.metadataConfigurationsResponse?.configurations;

    expect(configs != null && configs.first.name == 'metaData', true);
  });

  test('SetPresetResponse is not null when doc parsed', () {
    final response = File('xml/SetPresetResponse.xml').readAsStringSync();

    final envelope = Envelope.fromXml(response);

    var presetResponse = envelope.body.setPresetResponse;

    expect(presetResponse != null && presetResponse.presetToken == '20', true);
  });
}
