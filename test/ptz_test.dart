import 'package:easy_onvif/ptz.dart';
import 'package:easy_onvif/src/model/envelope.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';

void main() {
  group("PTZ", () {
    group("Happytimesoft", () {
      test('AbsoluteMoveResponse', () {
        final response =
            File('test/xml/happytimesoft/ptz/AbsoluteMoveResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!.containsKey('AbsoluteMoveResponse'), true);
      });

      test('ContinuousMoveResponse', () {
        final response =
            File('test/xml/happytimesoft/ptz/ContinuousMoveResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(envelope.body.response!.containsKey('ContinuousMoveResponse'),
            true);
      });

      test('GetCompatibleConfigurationsResponse', () {
        final response = File(
                'test/xml/happytimesoft/ptz/GetCompatibleConfigurationsResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetCompatibleConfigurationsResponse.fromJson(
                    envelope.body.response!)
                .ptzConfigurations
                .isNotEmpty,
            true);
      });

      test('GetConfigurationResponse', () {
        final response =
            File('test/xml/happytimesoft/ptz/GetConfigurationResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetConfigurationResponse.fromJson(envelope.body.response!)
                .ptzConfiguration
                .useCount,
            2);
      });

      test('GetConfigurationOptionsResponse', () {
        final response = File(
                'test/xml/happytimesoft/ptz/GetConfigurationOptionsResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetConfigurationOptionsResponse.fromJson(envelope.body.response!)
                .ptzConfigurationOptions
                .ptzTimeout
                .min,
            'PT1S');
      });

      test('GetConfigurationsResponse', () {
        final response =
            File('test/xml/happytimesoft/ptz/GetConfigurationsResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetConfigurationsResponse.fromJson(envelope.body.response!)
                .ptzConfigurations
                .isNotEmpty,
            true);
      });

      test('GetPresetsResponse', () {
        final response =
            File('test/xml/happytimesoft/ptz/GetPresetsResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetPresetsResponse.fromJson(envelope.body.response!)
                .presets
                .isEmpty,
            true);
      });

      test('GetServiceCapabilitiesResponse', () {
        final response = File(
                'test/xml/happytimesoft/ptz/GetServiceCapabilitiesResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .eFlip,
            true);
      });

      test('GetStatusResponse', () {
        final response =
            File('test/xml/happytimesoft/ptz/GetStatusResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetStatusResponse.fromJson(envelope.body.response!).ptzStatus.error,
            null);
      });

      test('GotoHomePositionResponse', () {
        final response =
            File('test/xml/happytimesoft/ptz/GotoHomePositionResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(envelope.body.response!.containsKey('GotoHomePositionResponse'),
            true);
      });

      test('RelativeMoveResponse', () {
        final response =
            File('test/xml/happytimesoft/ptz/RelativeMoveResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!.containsKey('RelativeMoveResponse'), true);
      });

      test('StopResponse', () {
        final response = File('test/xml/happytimesoft/ptz/StopResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(envelope.body.response!.containsKey('StopResponse'), true);
      });
    });

    group("ENP1A14-IR_25X", () {
      test('AbsoluteMoveResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/ptz/AbsoluteMoveResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!.containsKey('AbsoluteMoveResponse'), true);
      });

      test('ContinuousMoveResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/ptz/ContinuousMoveResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(envelope.body.response!.containsKey('ContinuousMoveResponse'),
            true);
      });

      test('GetCompatibleConfigurationsResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/ptz/GetCompatibleConfigurationsResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetCompatibleConfigurationsResponse.fromJson(
                    envelope.body.response!)
                .ptzConfigurations
                .isNotEmpty,
            true);
      });

      test('GetConfigurationResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/ptz/GetConfigurationResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetConfigurationResponse.fromJson(envelope.body.response!)
                .ptzConfiguration
                .token,
            'PTZToken');
      });

      test('GetConfigurationOptionsResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/ptz/GetConfigurationOptionsResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetConfigurationOptionsResponse.fromJson(envelope.body.response!)
                .ptzConfigurationOptions
                .ptzTimeout
                .min,
            'PT1S');
      });

      test('GetConfigurationsResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/ptz/GetConfigurationsResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetConfigurationsResponse.fromJson(envelope.body.response!)
                .ptzConfigurations
                .isNotEmpty,
            true);
      });

      test('GetPresetsResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/ptz/GetPresetsResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetPresetsResponse.fromJson(envelope.body.response!)
                .presets
                .isNotEmpty,
            true);
      });

      test('GetServiceCapabilitiesResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/ptz/GetServiceCapabilitiesResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .getCompatibleConfigurations,
            true);
      });

      test('GetStatusResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/ptz/GetStatusResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetStatusResponse.fromJson(envelope.body.response!).ptzStatus.error,
            "NO error");
      });

      test('GotoHomePositionResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/ptz/GotoHomePositionResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(envelope.body.response!.containsKey('GotoHomePositionResponse'),
            true);
      });

      test('GotoPresetResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/ptz/GotoPresetResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(envelope.body.response!.containsKey('GotoPresetResponse'), true);
      });

      test('RelativeMoveResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/ptz/RelativeMoveResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!.containsKey('RelativeMoveResponse'), true);
      });

      test('RemovePresetResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/ptz/RemovePresetResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!.containsKey('RemovePresetResponse'), true);
      });

      test('SetHomePositionResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/ptz/SetHomePositionResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(envelope.body.response!.containsKey('SetHomePositionResponse'),
            true);
      });

      test('SetPresetResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/ptz/SetPresetResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(SetPresetResponse.fromJson(envelope.body.response!).presetToken,
            '21');
      });

      test('StopResponse', () {
        final response = File('test/xml/ENP1A14-IR_25X/ptz/StopResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(envelope.body.response!.containsKey('StopResponse'), true);
      });
    });
  });
}
