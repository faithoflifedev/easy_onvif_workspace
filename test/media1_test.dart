import 'package:easy_onvif/media1.dart';
import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/src/model/envelope.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';

void main() {
  group('Media1', () {
    group('Happytimesoft', () {
      test('GetAudioSourcesResponse', () {
        final response =
            File('test/xml/happytimesoft/media1/GetAudioSourcesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetAudioSourcesResponse.fromJson(envelope.body.response!)
                .audioSources
                .isNotEmpty,
            true);
      });

      test('GetMetadataConfigurationResponse', () {
        final response = File(
                'test/xml/happytimesoft/media1/GetMetadataConfigurationResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetMetadataConfigurationResponse.fromJson(envelope.body.response!)
                .configuration
                .name,
            'MetadataConfigurationName_1');
      });

      test('GetMetadataConfigurationsResponse', () {
        final response = File(
                'test/xml/happytimesoft/media1/GetMetadataConfigurationsResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetMetadataConfigurationsResponse.fromJson(envelope.body.response!)
                .configurations
                .isNotEmpty,
            true);
      });

      test('GetProfileResponse', () {
        final response =
            File('test/xml/happytimesoft/media1/GetProfileResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetProfileResponse.fromJson(envelope.body.response!).profile.fixed,
            true);
      });

      test('GetProfilesResponse', () {
        final response =
            File('test/xml/happytimesoft/media1/GetProfilesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetProfilesResponse.fromJson(envelope.body.response!)
                .profiles
                ?.isNotEmpty,
            true);
      });

      test('GetServiceCapabilitiesResponse', () {
        final response = File(
                'test/xml/happytimesoft/media1/GetServiceCapabilitiesResponse.xml')
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
            File('test/xml/happytimesoft/media1/GetSnapshotUriResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetSnapshotUriResponse.fromJson(envelope.body.response!)
                .mediaUri
                .uri,
            'http://192.168.2.119:10000/snapshot/ProfileToken_1');
      });

      test('GetStreamUriResponse', () {
        final response =
            File('test/xml/happytimesoft/media1/GetStreamUriResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetStreamUriResponse.fromJson(envelope.body.response!)
                    .mediaUri
                    .timeout ==
                'PT60S',
            true);
      });

      test('GetVideoSourcesResponse', () {
        final response =
            File('test/xml/happytimesoft/media1/GetVideoSourcesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetVideoSourcesResponse.fromJson(envelope.body.response!)
                .videoSources
                .isNotEmpty,
            true);
      });

      test('StartMulticastStreamingResponse', () {
        final response = File(
                'test/xml/happytimesoft/media1/StartMulticastStreamingResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!
                .containsKey('StartMulticastStreamingResponse'),
            true);
      });

      test('StopMulticastStreamingResponse', () {
        final response = File(
                'test/xml/happytimesoft/media1/StopMulticastStreamingResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!
                .containsKey('StopMulticastStreamingResponse'),
            true);
      });
    });

    group('ENP1A14-IR_25X', () {
      test('GetAudioSourcesResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/media1/GetAudioSourcesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetAudioSourcesResponse.fromJson(envelope.body.response!)
                .audioSources
                .isNotEmpty,
            true);
      });

      test('GetMetadataConfigurationResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/media1/GetMetadataConfigurationResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetMetadataConfigurationResponse.fromJson(envelope.body.response!)
                .configuration
                .name,
            'metaData');
      });

      test('GetMetadataConfigurationsResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/media1/GetMetadataConfigurationsResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetMetadataConfigurationsResponse.fromJson(envelope.body.response!)
                .configurations
                .isNotEmpty,
            true);
      });

      test('GetProfileResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/media1/GetProfileResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetProfileResponse.fromJson(envelope.body.response!).profile.token,
            'Profile_1');
      });

      test('GetProfilesResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/media1/GetProfilesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetProfilesResponse.fromJson(envelope.body.response!)
                .profiles
                ?.isNotEmpty,
            true);
      });

      test('GetServiceCapabilitiesResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/media1/GetServiceCapabilitiesResponse.xml')
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
            File('test/xml/ENP1A14-IR_25X/media1/GetSnapshotUriResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetSnapshotUriResponse.fromJson(envelope.body.response!)
                .mediaUri
                .uri,
            'http://192.168.1.182/onvif-http/snapshot?Profile_1');
      });

      test('GetStreamUriResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/media1/GetStreamUriResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
          GetStreamUriResponse.fromJson(envelope.body.response!).mediaUri.uri,
          'rtsp://192.168.1.182:554/Streaming/Channels/101?transportmode=mcast&profile=Profile_1',
        );
      });

      test('GetVideoSourcesResponse', () {
        final response =
            File('test/xml/ENP1A14-IR_25X/media1/GetVideoSourcesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetVideoSourcesResponse.fromJson(envelope.body.response!)
                .videoSources
                .isNotEmpty,
            true);
      });

      test('StartMulticastStreamingResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/media1/StartMulticastStreamingResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!
                .containsKey('StartMulticastStreamingResponse'),
            true);
      });

      test('StopMulticastStreamingResponse', () {
        final response = File(
                'test/xml/ENP1A14-IR_25X/media1/StopMulticastStreamingResponse.xml')
            .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!
                .containsKey('StopMulticastStreamingResponse'),
            true);
      });
    });

    group('DCS-6511', () {
      test('GetAudioSourcesResponse', () {
        final response =
            File('test/xml/DCS-6511/media1/GetAudioSourcesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetAudioSourcesResponse.fromJson(envelope.body.response!)
                .audioSources
                .isNotEmpty,
            true);
      });

      test('GetMetadataConfigurationsResponse', () {
        final response = File(
                'test/xml/DCS-6511/media1/GetMetadataConfigurationsResponse.xml')
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
            File('test/xml/DCS-6511/media1/GetProfilesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetProfilesResponse.fromJson(envelope.body.response!)
                .profiles
                ?.isNotEmpty,
            true);
      });

      test('GetSnapshotUriResponse', () {
        final response =
            File('test/xml/DCS-6511/media1/GetSnapshotUriResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetSnapshotUriResponse.fromJson(envelope.body.response!)
                .mediaUri
                .uri,
            'http://192.168.1.33/dms?nowprofileid=1');
      });

      test('GetVideoSourcesResponse', () {
        final response =
            File('test/xml/DCS-6511/media1/GetVideoSourcesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetVideoSourcesResponse.fromJson(envelope.body.response!)
                .videoSources
                .isNotEmpty,
            true);
      });

      test('StartMulticastStreamingResponse', () {
        final response =
            File('test/xml/DCS-6511/media1/StartMulticastStreamingResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!
                .containsKey('StartMulticastStreamingResponse'),
            true);
      });

      test('StopMulticastStreamingResponse', () {
        final response =
            File('test/xml/DCS-6511/media1/StopMulticastStreamingResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            envelope.body.response!
                .containsKey('StopMulticastStreamingResponse'),
            true);
      });
    });

    group('GX728MF-IR28', () {
      test('GetAudioSourcesResponse', () {
        final response =
            File('test/xml/GX728MF-IR28/media1/GetAudioSourcesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetAudioSourcesResponse.fromJson(envelope.body.response!)
                .audioSources
                .isEmpty,
            true);
      });

      test('GetMetadataConfigurationsResponse', () {
        final response = File(
                'test/xml/GX728MF-IR28/media1/GetMetadataConfigurationsResponse.xml')
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
            File('test/xml/GX728MF-IR28/media1/GetProfilesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetProfilesResponse.fromJson(envelope.body.response!)
                .profiles
                ?.isNotEmpty,
            true);
      });

      test('GetServiceCapabilitiesResponse', () {
        final response = File(
                'test/xml/GX728MF-IR28/media1/GetServiceCapabilitiesResponse.xml')
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
            File('test/xml/GX728MF-IR28/media1/GetSnapshotUriResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetSnapshotUriResponse.fromJson(envelope.body.response!)
                .mediaUri
                .uri,
            'http://192.168.1.127:85/images/snapshot.jpg');
      });

      test('GetVideoSourcesResponse', () {
        final response =
            File('test/xml/GX728MF-IR28/media1/GetVideoSourcesResponse.xml')
                .readAsStringSync();

        final envelope = Envelope.fromXml(response);

        expect(
            GetVideoSourcesResponse.fromJson(envelope.body.response!)
                .videoSources
                .isNotEmpty,
            true);
      });
    });
  });
}
