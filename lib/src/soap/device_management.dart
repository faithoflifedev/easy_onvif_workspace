import 'package:easy_onvif/device_management.dart';
import 'package:xml/xml.dart';

import 'transport.dart';
import 'xmlns.dart';

class DeviceManagementRequest {
  /// XML for the [createUsers]
  static XmlDocumentFragment createUsers(List<User> users) {
    Transport.builder.element('CreateUsers', nest: () {
      Transport.builder.namespace(Xmlns.tds);

      for (var user in users) {
        Transport.builder.element('User', nest: () {
          Transport.builder.namespace(Xmlns.tds);
          Transport.builder.element('Username', nest: () {
            Transport.builder.namespace(Xmlns.tt);
            Transport.builder.text(user.username);
          });

          if (user.password != null) {
            Transport.builder.element('Password', nest: () {
              Transport.builder.namespace(Xmlns.tt);
              Transport.builder.text(user.password!);
            });
          }

          Transport.builder.element('UserLevel', nest: () {
            Transport.builder.namespace(Xmlns.tt);
            Transport.builder.text(user.userLevel.code);
          });
        });
      }
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [deleteUsers]
  static XmlDocumentFragment deleteUsers(List<String> userNames) {
    Transport.builder.element('DeleteUsers', nest: () {
      Transport.builder.namespace(Xmlns.tds);

      for (var userName in userNames) {
        Transport.builder.element('Username', nest: userName);
      }
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [systemDateAndTime]
  static XmlDocumentFragment systemDateAndTime() =>
      Transport.quickTag('GetSystemDateAndTime', Xmlns.tds);

  ///XML for the [capabilities]
  static XmlDocumentFragment capabilities(String category) {
    Transport.builder.element('GetCapabilities', nest: () {
      Transport.builder.namespace(Xmlns.tds);
      Transport.builder.element('Category', nest: () {
        Transport.builder.text(category);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getServices]
  static XmlDocumentFragment getServices([bool includeCapability = false]) {
    Transport.builder.element('GetServices', nest: () {
      Transport.builder.namespace(Xmlns.tds);

      Transport.builder.element('IncludeCapability', nest: () {
        Transport.builder.text(includeCapability ? 'true' : false);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getStorageConfiguration]
  static XmlDocumentFragment getStorageConfiguration(String referenceToken) {
    Transport.builder.element('GetStorageConfiguration', nest: () {
      Transport.builder.namespace(Xmlns.tds);

      Transport.builder.element('Token', nest: () {
        Transport.builder.namespace(Xmlns.tds);
        Transport.builder.text(referenceToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getStorageConfigurations]
  static XmlDocumentFragment getStorageConfigurations() =>
      Transport.quickTag('GetStorageConfigurations', Xmlns.tds);

  /// XML for the [getSystemLog]
  static XmlDocumentFragment getSystemLog(String logType) {
    Transport.builder.element('GetSystemLog', nest: () {
      Transport.builder.namespace(Xmlns.tds);

      Transport.builder.element('LogType', nest: () {
        Transport.builder.namespace(Xmlns.tds);

        Transport.builder.text(logType);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getSystemSupportInformation]
  static XmlDocumentFragment getSystemSupportInformation() {
    Transport.builder.element('GetSystemSupportInformation', nest: () {
      Transport.builder.namespace(Xmlns.tds);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [deviceInformation]
  static XmlDocumentFragment deviceInformation() => Transport.quickTag(
        'GetDeviceInformation',
        Xmlns.tds,
      );

  /// XML for the [hostname]
  static XmlDocumentFragment hostname() => Transport.quickTag(
        'GetHostname',
        Xmlns.tds,
      );

  /// XML for the [endpointReference]
  static XmlDocumentFragment endpointReference() => Transport.quickTag(
        'GetEndpointReference',
        Xmlns.tds,
      );

  /// XML for the [serviceCapabilities]
  static XmlDocumentFragment serviceCapabilities() => Transport.quickTag(
        'GetServiceCapabilities',
        Xmlns.tds,
      );

  /// XML for the [networkProtocols]
  static XmlDocumentFragment networkProtocols() => Transport.quickTag(
        'GetNetworkProtocols',
        Xmlns.tds,
      );

  /// XML for the [systemReboot]
  static XmlDocumentFragment systemReboot() => Transport.quickTag(
        'SystemReboot',
        Xmlns.tds,
      );

  /// XML for the [systemUris]
  static XmlDocumentFragment systemUris() => Transport.quickTag(
        'GetSystemUris',
        Xmlns.tds,
      );

  /// XML for the [getUsers]
  static XmlDocumentFragment getUsers() => Transport.quickTag(
        'GetUsers',
        Xmlns.tds,
      );

  static XmlDocumentFragment discoveryMode() => Transport.quickTag(
        'GetDiscoveryMode',
        Xmlns.tds,
      );

  static XmlDocumentFragment dns() => Transport.quickTag(
        'GetDNS',
        Xmlns.tds,
      );

  /// XML for the [ntp]
  static XmlDocumentFragment ntp() => Transport.quickTag(
        'GetNTP',
        Xmlns.tds,
      );

  /// XML for the [getGeoLocation]
  static XmlDocumentFragment getGeoLocation() => Transport.quickTag(
        'GetGeoLocation',
        Xmlns.tds,
      );

  /// XML for the [getEndpointReference]
  static XmlDocumentFragment getEndpointReference() => Transport.quickTag(
        'GetEndpointReference',
        Xmlns.tds,
      );
}
