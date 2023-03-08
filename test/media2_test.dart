import 'package:easy_onvif/media2.dart';
import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/src/model/envelope.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';

void main() {
  group('Media2', () {
    group('Happytimesoft', () {
      test('GetMetadataConfigurationOptionsResponse', () {
        final response = File(
                'test/xml/happytimesoft/media2/GetMetadataConfigurationOptionsResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetMetadataConfigurationOptionsResponse.fromJson(
                    envelope.body.response!)
                .options
                .ptzStatusFilterOptions
                .zoomStatusSupported,
            true);
      });

      test('GetMetadataConfigurationsResponse', () {
        final response = File(
                'test/xml/happytimesoft/media2/GetMetadataConfigurationsResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetMetadataConfigurationsResponse.fromJson(envelope.body.response!)
                .configurations
                .isNotEmpty,
            true);
      });

      test('GetProfilesResponse', () {
        final response =
            File('test/xml/happytimesoft/media2/GetProfilesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetProfilesResponse.fromJson(envelope.body.response!)
                .profiles
                .isNotEmpty,
            true);
      });

      test('GetServiceCapabilitiesResponse', () {
        final response = File(
                'test/xml/happytimesoft/media2/GetServiceCapabilitiesResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .snapshotUri,
            true);
      });

      test('GetSnapshotUriResponse', () {
        final response =
            File('test/xml/happytimesoft/media2/GetSnapshotUriResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(GetSnapshotUriResponse.fromJson(envelope.body.response!).uri,
            'http://192.168.2.119:10000/snapshot/ProfileToken_1');
      });

      test('GetStreamUriResponse', () {
        final response =
            File('test/xml/happytimesoft/media2/GetStreamUriResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetStreamUriResponse.fromJson(envelope.body.response!).uri ==
                'rtsp://192.168.2.119/test.mp4&ve=H264&w=1280&h=720&ae=PCMU&sr=8000',
            true);
      });

      test('StartMulticastStreamingResponse', () {
        final response = File(
                'test/xml/happytimesoft/media2/StartMulticastStreamingResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!
                .containsKey('StartMulticastStreamingResponse'),
            true);
      });

      test('StopMulticastStreamingResponse', () {
        final response = File(
                'test/xml/happytimesoft/media2/StopMulticastStreamingResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!
                .containsKey('StopMulticastStreamingResponse'),
            true);
      });
    });

    group('ENP1A14-IR_25X', () {
      test('GetMetadataConfigurationOptionsResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/media2/GetMetadataConfigurationOptionsResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetMetadataConfigurationOptionsResponse.fromJson(
                    envelope.body.response!)
                .options
                .ptzStatusFilterOptions
                .zoomStatusSupported,
            false);
      });

      test('GetMetadataConfigurationsResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/media2/GetMetadataConfigurationsResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetMetadataConfigurationsResponse.fromJson(envelope.body.response!)
                .configurations
                .isNotEmpty,
            true);
      });

      test('GetProfilesResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/media2/GetProfilesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetProfilesResponse.fromJson(envelope.body.response!)
                .profiles
                .isNotEmpty,
            true);
      });

      test('GetServiceCapabilitiesResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/media2/GetServiceCapabilitiesResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .snapshotUri,
            true);
      });

      test('GetSnapshotUriResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/media2/GetSnapshotUriResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(GetSnapshotUriResponse.fromJson(envelope.body.response!).uri,
            'http://192.168.1.182/onvif-http/snapshot?Profile_1');
      });

      test('GetStreamUriResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/media2/GetStreamUriResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetStreamUriResponse.fromJson(envelope.body.response!).uri ==
                'rtsp://192.168.1.182/Streaming/Channels/101?transportmode=unicast&profile=Profile_1',
            true);
      });

      test('StartMulticastStreamingResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/media2/StartMulticastStreamingResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!
                .containsKey('StartMulticastStreamingResponse'),
            true);
      });

      test('StopMulticastStreamingResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/media2/StopMulticastStreamingResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!
                .containsKey('StopMulticastStreamingResponse'),
            true);
      });
    });

    group('GX728MF-IR28', () {
      test('GetMetadataConfigurationOptionsResponse', () {
        final response = File(
                'test/xml/GX728MF-IR28/media2/GetMetadataConfigurationOptionsResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetMetadataConfigurationOptionsResponse.fromJson(
                    envelope.body.response!)
                .options
                .ptzStatusFilterOptions
                .zoomStatusSupported,
            false);
      });

      test('GetMetadataConfigurationsResponse', () {
        final response = File(
                'test/xml/GX728MF-IR28/media2/GetMetadataConfigurationsResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetMetadataConfigurationsResponse.fromJson(envelope.body.response!)
                .configurations
                .isNotEmpty,
            true);
      });

      test('GetProfilesResponse', () {
        final response =
            File('test/xml/GX728MF-IR28/media2/GetProfilesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetProfilesResponse.fromJson(envelope.body.response!)
                .profiles
                .isNotEmpty,
            true);
      });

      test('GetServiceCapabilitiesResponse', () {
        final response = File(
                'test/xml/GX728MF-IR28/media2/GetServiceCapabilitiesResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .snapshotUri,
            true);
      });

      test('GetSnapshotUriResponse', () {
        final response =
            File('test/xml/GX728MF-IR28/media2/GetSnapshotUriResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(GetSnapshotUriResponse.fromJson(envelope.body.response!).uri,
            'http://192.168.1.127:85/images/snapshot.jpg');
      });
    });
  });
}
