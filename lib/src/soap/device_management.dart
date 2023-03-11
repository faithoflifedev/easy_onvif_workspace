import 'package:easy_onvif/device_management.dart';
import 'package:easy_onvif/soap.dart';
import 'package:xml/xml.dart';

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
  static XmlDocumentFragment systemDateAndTime() {
    Transport.builder.element('GetSystemDateAndTime', nest: () {
      Transport.builder.namespace(Xmlns.tds);
    });

    return Transport.builder.buildFragment();
  }

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
  static XmlDocumentFragment getServices([includeCapability = false]) {
    Transport.builder.element('GetServices', nest: () {
      Transport.builder.namespace(Xmlns.tds);

      Transport.builder.element('IncludeCapability', nest: () {
        Transport.builder.text(includeCapability ? 'true' : false);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [deviceInformation]
  static XmlDocumentFragment deviceInformation() {
    Transport.builder.element('GetDeviceInformation', nest: () {
      Transport.builder.namespace(Xmlns.tds);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [hostname]
  static XmlDocumentFragment hostname() {
    Transport.builder.element('GetHostname', nest: () {
      Transport.builder.namespace(Xmlns.tds);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [endpointReference]
  static XmlDocumentFragment endpointReference() {
    Transport.builder.element('GetEndpointReference', nest: () {
      Transport.builder.namespace(Xmlns.tds);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [serviceCapabilities]
  static XmlDocumentFragment serviceCapabilities() {
    Transport.builder.element('GetServiceCapabilities', nest: () {
      Transport.builder.namespace(Xmlns.tds);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [networkProtocols]
  static XmlDocumentFragment networkProtocols() {
    Transport.builder.element('GetNetworkProtocols', nest: () {
      Transport.builder.namespace(Xmlns.tds);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [systemUris]
  static XmlDocumentFragment systemUris() {
    Transport.builder.element('GetSystemUris', nest: () {
      Transport.builder.namespace(Xmlns.tds);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getUsers]
  static XmlDocumentFragment getUsers() {
    Transport.builder.element('GetUsers', nest: () {
      Transport.builder.namespace(Xmlns.tds);
    });

    return Transport.builder.buildFragment();
  }

  static XmlDocumentFragment discoveryMode() {
    Transport.builder.element('GetDiscoveryMode', nest: () {
      Transport.builder.namespace(Xmlns.tds);
    });

    return Transport.builder.buildFragment();
  }

  static XmlDocumentFragment dns() {
    Transport.builder.element('GetDNS', nest: () {
      Transport.builder.namespace(Xmlns.tds);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [ntp]
  static XmlDocumentFragment ntp() {
    Transport.builder.element('GetNTP', nest: () {
      Transport.builder.namespace(Xmlns.tds);
    });

    return Transport.builder.buildFragment();
  }
}
