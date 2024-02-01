import 'package:easy_onvif/device_management.dart';
import 'package:easy_onvif/src/model/envelope.dart';
import 'package:test/test.dart';

void main() {
  group('Device Management', () {
    group('unknown', () {
      test('GetCapabilitiesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/unknown/device_management/GetCapabilitiesResponse.xml');

        expect(
            GetCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .device
                ?.xAddr,
            'http://10.201.1.11:80/onvif/Device_service');
      });
    });

    group('Happytimesoft', () {
      test('CreateUsersResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/CreateUsersResponse.xml');

        expect(
            envelope.body.response?.containsKey('CreateUsersResponse'), true);
      });

      test('DeleteUsersResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/DeleteUsersResponse.xml');

        expect(
            envelope.body.response?.containsKey('DeleteUsersResponse'), true);
      });

      test('GetCapabilitiesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/GetCapabilitiesResponse.xml');

        expect(
            GetCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .device
                ?.xAddr,
            'http://192.168.2.119:10000/onvif/device_service');
      });

      test('GetDeviceInformationResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/GetDeviceInformationResponse.xml');

        expect(
            GetDeviceInformationResponse.fromJson(envelope.body.response!)
                .model,
            'IPCamera');
      });

      test('GetDiscoveryModeResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/GetDiscoveryModeResponse.xml');

        expect(
            GetDiscoveryModeResponse.fromJson(envelope.body.response!)
                .discoveryMode,
            'Discoverable');
      });

      test('GetDNSResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/GetDNSResponse.xml');

        expect(
            GetDnsResponse.fromJson(envelope.body.response!)
                .dnsInformation
                .fromDhcp,
            false);
      });

      test('GetHostnameResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/GetHostnameResponse.xml');

        expect(
            GetHostnameResponse.fromJson(envelope.body.response!)
                .hostnameInformation
                .name,
            'LAPTOP-3NFBA69L');
      });

      test('GetNetworkProtocolsResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/GetNetworkProtocolsResponse.xml');

        expect(
            GetNetworkProtocolsResponse.fromJson(envelope.body.response!)
                .networkProtocols
                .isNotEmpty,
            true);
      });

      test('GetNTPResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/GetNTPResponse.xml');

        expect(
            GetNtpResponse.fromJson(envelope.body.response!)
                .ntpInformation
                .fromDhcp,
            false);
      });

      test('GetServiceCapabilitiesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/GetServiceCapabilitiesResponse.xml');

        expect(
            GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .security!
                .dot1x,
            true);
      });

      test('GetServicesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/GetServicesResponse.xml');

        expect(
            GetServicesResponse.fromJson(envelope.body.response!)
                .services
                .isNotEmpty,
            true);
      });

      test('GetSystemDateAndTimeResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/GetSystemDateAndTimeResponse.xml');

        expect(
            GetSystemDateAndTimeResponse.fromJson(envelope.body.response!)
                .systemDateAndTime
                .dateTimeType,
            'NTP');
      });

      test('GetSystemUrisResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/GetSystemUrisResponse.xml');

        expect(
            GetSystemUrisResponse.fromJson(envelope.body.response!)
                .supportInfoUri,
            'http://192.168.2.119:10000/SupportInfo');
      });

      test('GetUsersResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/happytimesoft/device_management/GetUsersResponse.xml');

        expect(
            GetUsersResponse.fromJson(envelope.body.response!).users.isNotEmpty,
            true);
      });
    });

    group('ENP1A14-IR_25X', () {
      test('CreateUsersResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/CreateUsersResponse.xml');

        expect(
            envelope.body.response?.containsKey('CreateUsersResponse'), true);
      });

      test('DeleteUsersResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/DeleteUsersResponse.xml');

        expect(
            envelope.body.response?.containsKey('DeleteUsersResponse'), true);
      });

      test('GetCapabilitiesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/GetCapabilitiesResponse.xml');

        expect(
            GetCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .device
                ?.xAddr,
            'http://192.168.1.182/onvif/device_service');
      });

      test('GetDeviceInformationResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/GetDeviceInformationResponse.xml');

        expect(
            GetDeviceInformationResponse.fromJson(envelope.body.response!)
                .model,
            'ENP1A14-IR/25X');
      });

      test('GetDiscoveryModeResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/GetDiscoveryModeResponse.xml');

        expect(
            GetDiscoveryModeResponse.fromJson(envelope.body.response!)
                .discoveryMode,
            'Discoverable');
      });

      test('GetDNSResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/GetDNSResponse.xml');

        expect(
            GetDnsResponse.fromJson(envelope.body.response!)
                .dnsInformation
                .fromDhcp,
            false);
      });

      test('GetHostnameResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/GetHostnameResponse.xml');

        expect(
            GetHostnameResponse.fromJson(envelope.body.response!)
                .hostnameInformation
                .name,
            'localhost');
      });

      test('GetNetworkProtocolsResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/GetNetworkProtocolsResponse.xml');

        expect(
            GetNetworkProtocolsResponse.fromJson(envelope.body.response!)
                .networkProtocols
                .isNotEmpty,
            true);
      });

      test('GetNTPResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/GetNTPResponse.xml');

        expect(
            GetNtpResponse.fromJson(envelope.body.response!)
                .ntpInformation
                .fromDhcp,
            false);
      });

      test('GetServiceCapabilitiesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/GetServiceCapabilitiesResponse.xml');

        expect(
            GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .security!
                .tls1_2,
            true);
      });

      test('GetServicesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/GetServicesResponse.xml');

        expect(
            GetServicesResponse.fromJson(envelope.body.response!)
                .services
                .isNotEmpty,
            true);
      });

      test('GetSystemDateAndTimeResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/GetSystemDateAndTimeResponse.xml');

        expect(
            GetSystemDateAndTimeResponse.fromJson(envelope.body.response!)
                .systemDateAndTime
                .dateTimeType,
            'Manual');
      });

      test('GetSystemUrisResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/GetSystemUrisResponse.xml');

        expect(
            GetSystemUrisResponse.fromJson(envelope.body.response!)
                .supportInfoUri,
            null);
      });

      test('GetUsersResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/ENP1A14-IR_25X/device_management/GetUsersResponse.xml');

        expect(
            GetUsersResponse.fromJson(envelope.body.response!).users.isNotEmpty,
            true);
      });
    });

    group('DCS-6511', () {
      test('CreateUsersResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/DCS-6511/device_management/CreateUsersResponse.xml');

        expect(
            envelope.body.response?.containsKey('CreateUsersResponse'), true);
      });

      test('DeleteUsersResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/DCS-6511/device_management/DeleteUsersResponse.xml');

        expect(
            envelope.body.response?.containsKey('DeleteUsersResponse'), true);
      });

      test('GetCapabilitiesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/DCS-6511/device_management/GetCapabilitiesResponse.xml');

        expect(
            GetCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .device
                ?.xAddr,
            'http://192.168.1.33:80/onvif/device_service');
      });

      test('GetDeviceInformationResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/DCS-6511/device_management/GetDeviceInformationResponse.xml');

        expect(
            GetDeviceInformationResponse.fromJson(envelope.body.response!)
                .model,
            'DCS-6511');
      });

      test('GetDiscoveryModeResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/DCS-6511/device_management/GetDiscoveryModeResponse.xml');

        expect(
            GetDiscoveryModeResponse.fromJson(envelope.body.response!)
                .discoveryMode,
            'Discoverable');
      });

      test('GetDNSResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/DCS-6511/device_management/GetDNSResponse.xml');

        expect(
            GetDnsResponse.fromJson(envelope.body.response!)
                .dnsInformation
                .fromDhcp,
            false);
      });

      test('GetHostnameResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/DCS-6511/device_management/GetHostnameResponse.xml');

        expect(
            GetHostnameResponse.fromJson(envelope.body.response!)
                .hostnameInformation
                .name,
            'DCS-6511');
      });

      test('GetNetworkProtocolsResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/DCS-6511/device_management/GetNetworkProtocolsResponse.xml');

        expect(
            GetNetworkProtocolsResponse.fromJson(envelope.body.response!)
                .networkProtocols
                .isNotEmpty,
            true);
      });

      test('GetNTPResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/DCS-6511/device_management/GetNTPResponse.xml');

        expect(
            GetNtpResponse.fromJson(envelope.body.response!)
                .ntpInformation
                .fromDhcp,
            false);
      });

      test('GetSystemDateAndTimeResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/DCS-6511/device_management/GetSystemDateAndTimeResponse.xml');

        expect(
            GetSystemDateAndTimeResponse.fromJson(envelope.body.response!)
                .systemDateAndTime
                .dateTimeType,
            'NTP');
      });

      test('GetSystemUrisResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/DCS-6511/device_management/GetSystemUrisResponse.xml');

        expect(
            envelope.body.response?.containsKey('GetSystemUrisResponse'), true);
      });

      test('GetUsersResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/DCS-6511/device_management/GetUsersResponse.xml');

        expect(
            GetUsersResponse.fromJson(envelope.body.response!).users.isNotEmpty,
            true);
      });
    });

    group('GX728MF-IR28', () {
      test('CreateUsersResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/CreateUsersResponse.xml');

        expect(
            envelope.body.response?.containsKey('CreateUsersResponse'), true);
      });

      test('DeleteUsersResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/DeleteUsersResponse.xml');

        expect(
            envelope.body.response?.containsKey('DeleteUsersResponse'), true);
      });

      test('GetCapabilitiesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/GetCapabilitiesResponse.xml');

        expect(
            GetCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .device
                ?.xAddr,
            'http://192.168.1.127:80/onvif/device_service');
      });

      test('GetDeviceInformationResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/GetDeviceInformationResponse.xml');

        expect(
            GetDeviceInformationResponse.fromJson(envelope.body.response!)
                .model,
            'GX728MF-IR28');
      });

      test('GetDiscoveryModeResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/GetDiscoveryModeResponse.xml');

        expect(
            GetDiscoveryModeResponse.fromJson(envelope.body.response!)
                .discoveryMode,
            'Discoverable');
      });

      test('GetDNSResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/GetDNSResponse.xml');

        expect(
            GetDnsResponse.fromJson(envelope.body.response!)
                .dnsInformation
                .fromDhcp,
            false);
      });

      test('GetHostnameResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/GetHostnameResponse.xml');

        expect(
            GetHostnameResponse.fromJson(envelope.body.response!)
                .hostnameInformation
                .name,
            'IPC');
      });

      test('GetNetworkProtocolsResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/GetNetworkProtocolsResponse.xml');

        expect(
            GetNetworkProtocolsResponse.fromJson(envelope.body.response!)
                .networkProtocols
                .isNotEmpty,
            true);
      });

      test('GetNTPResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/GetNTPResponse.xml');

        expect(
            GetNtpResponse.fromJson(envelope.body.response!)
                .ntpInformation
                .fromDhcp,
            false);
      });

      test('GetServiceCapabilitiesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/GetServiceCapabilitiesResponse.xml');

        expect(
            GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
                .capabilities
                .system!
                .discoveryBye,
            true);
      });

      test('GetServicesResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/GetServicesResponse.xml');

        expect(
            GetServicesResponse.fromJson(envelope.body.response!)
                .services
                .isNotEmpty,
            true);
      });

      test('GetSystemDateAndTimeResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/GetSystemDateAndTimeResponse.xml');

        expect(
            GetSystemDateAndTimeResponse.fromJson(envelope.body.response!)
                .systemDateAndTime
                .dateTimeType,
            'Manual');
      });

      test('GetUsersResponse', () {
        final envelope = Envelope.fromXmlFile(
            'test/xml/GX728MF-IR28/device_management/GetUsersResponse.xml');

        expect(
            GetUsersResponse.fromJson(envelope.body.response!).users.isNotEmpty,
            true);
      });
    });
  });
}
