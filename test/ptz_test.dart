import 'package:easy_onvif/ptz.dart';
import 'package:easy_onvif/src/model/envelope.dart';
import 'package:test/test.dart';

void main() {
  group("PTZ", () {
    group("Happytimesoft", () {
      test('AbsoluteMoveResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/ptz/AbsoluteMoveResponse.xml');

        expect(
            envelope.body.response!.containsKey('AbsoluteMoveResponse'), true);
      });

      test('ContinuousMoveResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/ptz/ContinuousMoveResponse.xml');

        expect(envelope.body.response!.containsKey('ContinuousMoveResponse'),
            true);
      });

      test('GetCompatibleConfigurationsResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/ptz/GetCompatibleConfigurationsResponse.xml');

        expect(
            GetCompatibleConfigurationsResponse.fromJson(
                    envelope.body.response!)
                .ptzConfigurations
                .isNotEmpty,
            true);
      });

      test('GetConfigurationResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/ptz/GetConfigurationResponse.xml');

        expect(
            GetConfigurationResponse.fromJson(envelope.body.response!)
                .ptzConfiguration
                .useCount,
            2);
      });

      test('GetConfigurationOptionsResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/ptz/GetConfigurationOptionsResponse.xml');

        expect(
            GetConfigurationOptionsResponse.fromJson(envelope.body.response!)
                .ptzConfigurationOptions
                .ptzTimeout
                .min,
            'PT1S');
      });

      test('GetConfigurationsResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/ptz/GetConfigurationsResponse.xml');

        expect(
            GetConfigurationsResponse.fromJson(envelope.body.response!)
                .ptzConfigurations
                .isNotEmpty,
            true);
      });

      test('GetPresetsResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/ptz/GetPresetsResponse.xml');

        expect(
            GetPresetsResponse.fromJson(envelope.body.response!)
                .presets
                .isEmpty,
            true);
      });

      test('GetServiceCapabilitiesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/ptz/GetServiceCapabilitiesResponse.xml');

        expect(
            GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .eFlip,
            true);
      });

      test('GetStatusResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/ptz/GetStatusResponse.xml');

        expect(
            GetStatusResponse.fromJson(envelope.body.response!).ptzStatus.error,
            null);
      });

      test('GotoHomePositionResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/ptz/GotoHomePositionResponse.xml');

        expect(envelope.body.response!.containsKey('GotoHomePositionResponse'),
            true);
      });

      test('RelativeMoveResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/ptz/RelativeMoveResponse.xml');

        expect(
            envelope.body.response!.containsKey('RelativeMoveResponse'), true);
      });

      test('StopResponse', () {
        final envelope =
            Envelope.fromXmlFile('test/xml/happytimesoft/ptz/StopResponse.xml');

        expect(envelope.body.response!.containsKey('StopResponse'), true);
      });
    });

    group("ENP1A14-IR_25X", () {
      test('AbsoluteMoveResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/AbsoluteMoveResponse.xml');

        expect(
            envelope.body.response!.containsKey('AbsoluteMoveResponse'), true);
      });

      test('ContinuousMoveResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/ContinuousMoveResponse.xml');

        expect(envelope.body.response!.containsKey('ContinuousMoveResponse'),
            true);
      });

      test('GetCompatibleConfigurationsResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/GetCompatibleConfigurationsResponse.xml');

        expect(
            GetCompatibleConfigurationsResponse.fromJson(
                    envelope.body.response!)
                .ptzConfigurations
                .isNotEmpty,
            true);
      });

      test('GetConfigurationResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/GetConfigurationResponse.xml');

        expect(
            GetConfigurationResponse.fromJson(envelope.body.response!)
                .ptzConfiguration
                .token,
            'PTZToken');
      });

      test('GetConfigurationOptionsResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/GetConfigurationOptionsResponse.xml');

        expect(
            GetConfigurationOptionsResponse.fromJson(envelope.body.response!)
                .ptzConfigurationOptions
                .ptzTimeout
                .min,
            'PT1S');
      });

      test('GetConfigurationsResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/GetConfigurationsResponse.xml');

        expect(
            GetConfigurationsResponse.fromJson(envelope.body.response!)
                .ptzConfigurations
                .isNotEmpty,
            true);
      });

      test('GetPresetsResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/GetPresetsResponse.xml');

        expect(
            GetPresetsResponse.fromJson(envelope.body.response!)
                .presets
                .isNotEmpty,
            true);
      });

      test('GetServiceCapabilitiesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/GetServiceCapabilitiesResponse.xml');

        expect(
            GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .getCompatibleConfigurations,
            true);
      });

      test('GetStatusResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/GetStatusResponse.xml');

        expect(
            GetStatusResponse.fromJson(envelope.body.response!).ptzStatus.error,
            "NO error");
      });

      test('GotoHomePositionResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/GotoHomePositionResponse.xml');

        expect(envelope.body.response!.containsKey('GotoHomePositionResponse'),
            true);
      });

      test('GotoPresetResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/GotoPresetResponse.xml');

        expect(envelope.body.response!.containsKey('GotoPresetResponse'), true);
      });

      test('RelativeMoveResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/RelativeMoveResponse.xml');

        expect(
            envelope.body.response!.containsKey('RelativeMoveResponse'), true);
      });

      test('RemovePresetResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/RemovePresetResponse.xml');

        expect(
            envelope.body.response!.containsKey('RemovePresetResponse'), true);
      });

      test('SetHomePositionResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/SetHomePositionResponse.xml');

        expect(envelope.body.response!.containsKey('SetHomePositionResponse'),
            true);
      });

      test('SetPresetResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/SetPresetResponse.xml');

        expect(SetPresetResponse.fromJson(envelope.body.response!).presetToken,
            '21');
      });

      test('StopResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/ptz/StopResponse.xml');

        expect(envelope.body.response!.containsKey('StopResponse'), true);
      });
    });
  });
}
