import 'package:easy_onvif/device_management.dart';
import 'package:easy_onvif/soap.dart' as soap;
import 'package:loggy/loggy.dart';

// ignore: constant_identifier_names
// enum CapabilityCategory { All, Analytics, Device, Events, Imaging, Media, PTZ }

class DeviceManagement with UiLoggy {
  final soap.Transport transport;

  final Uri uri;

  DeviceManagement({required this.transport, required this.uri});

  /// This operation creates new device users and corresponding credentials on a
  /// device for authentication purposes. The device shall support creation of
  /// device users and their credentials through the CreateUsers command. Either
  /// all users are created successfully or a fault message shall be returned
  /// without creating any user.
  ///
  /// ONVIF compliant devices are recommended to support password length of at
  /// least 28 bytes, as clients may follow the password derivation mechanism
  /// which results in 'password equivalent' of length 28 bytes, as described in
  /// section 3.1.2 of the ONVIF security white paper.
  Future<bool> createUsers(List<User> users) async {
    loggy.debug('createUsers');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.DeviceManagementRequest.createUsers(users)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }

  /// This operation deletes users on a device. The device shall support deletion
  /// of device users and their credentials through the DeleteUsers command. A
  /// device may have one or more fixed users that cannot be deleted to ensure
  /// access to the unit. Either all users are deleted successfully or a fault
  /// message shall be returned and no users be deleted.
  Future<bool> deleteUsers(List<String> users) async {
    loggy.debug('deleteUsers');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.DeviceManagementRequest.deleteUsers(users)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }

  /// This operation creates new device users and corresponding credentials on a
  /// device for authentication purposes. The device shall support creation of
  /// device users and their credentials through the CreateUsers command. Either
  /// all users are created successfully or a fault message shall be returned
  /// without creating any user.
  ///
  /// ONVIF compliant devices are recommended to support password length of at
  /// least 28 bytes, as clients may follow the password derivation mechanism
  /// which results in 'password equivalent' of length 28 bytes, as described in
  /// section 3.1.2 of the ONVIF security white paper.
  ///
  /// This method has been replaced by the more generic [getServices] method.
  /// For capabilities of individual services refer to the
  /// [getServiceCapabilities] methods.
  @Deprecated('Use [getServices]')
  Future<Capabilities> getCapabilities(
      {CapabilityCategory? capabilityCategory}) async {
    loggy.debug('getCapabilities');

    capabilityCategory ??= CapabilityCategory.all;

    final envelope = await transport.sendRequest(
        uri,
        transport.envelope(
            null,
            soap.DeviceManagementRequest.capabilities(
                capabilityCategory.value)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetCapabilitiesResponse.fromJson(envelope.body.response!)
        .capabilities;
  }

  /// This operation gets basic device information from the device.
  Future<GetDeviceInformationResponse> getDeviceInformation() async {
    loggy.debug('getDeviceInformation');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.DeviceManagementRequest.deviceInformation()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetDeviceInformationResponse.fromJson(envelope.body.response!);
  }

  /// This operation gets the discovery mode of a device. See Section 7.2 for
  /// the definition of the different device discovery modes. The device shall
  /// support retrieval of the discovery mode setting through the
  /// GetDiscoveryMode command.
  Future<String> getDiscoveryMode() async {
    loggy.debug('getDiscoveryMode');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.DeviceManagementRequest.discoveryMode()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetDiscoveryModeResponse.fromJson(envelope.body.response!)
        .discoveryMode;
  }

  /// This operation gets the DNS settings from a device. The device shall
  /// return its DNS configurations through the GetDNS command.
  Future<DnsInformation> getDns() async {
    loggy.debug('getDns');

    final envelope = await transport.sendRequest(
        uri, transport.securedEnvelope(soap.DeviceManagementRequest.dns()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetDnsResponse.fromJson(envelope.body.response!).dnsInformation;
  }

  /// This operation is used by an endpoint to get the hostname from a device.
  /// The device shall return its hostname configurations through the
  /// [getHostname]
  Future<HostnameInformation> getHostname() async {
    loggy.debug('getHostname');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.DeviceManagementRequest.hostname()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetHostnameResponse.fromJson(envelope.body.response!)
        .hostnameInformation;
  }

  /// This operation gets defined network protocols from a device. The device
  /// shall support the [getNetworkProtocols] command returning configured
  /// network protocols.
  Future<List<NetworkProtocol>> getNetworkProtocols() async {
    loggy.debug('getNetworkProtocols');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.DeviceManagementRequest.networkProtocols()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetNetworkProtocolsResponse.fromJson(envelope.body.response!)
        .networkProtocols;
  }

  /// This operation gets the NTP settings from a device. If the device supports
  /// NTP, it shall be possible to get the NTP server settings through the
  /// [getNtp] command.
  Future<NtpInformation> getNtp() async {
    loggy.debug('getNtp');

    final envelope = await transport.sendRequest(
        uri, transport.securedEnvelope(soap.DeviceManagementRequest.ntp()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetNtpResponse.fromJson(envelope.body.response!).ntpInformation;
  }

  /// Returns the capabilities of the device service. The result is returned in
  /// a typed answer.
  Future<DeviceServiceCapabilities> getServiceCapabilities() async {
    loggy.debug('getServiceCapabilities');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.DeviceManagementRequest.serviceCapabilities()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
        .capabilities;
  }

  /// Returns information about services on the device.
  Future<List<Service>> getServices([bool includeCapability = false]) async {
    loggy.debug('getServices');

    final envelope = await transport.sendRequest(
        uri,
        transport.envelope(
            null, soap.DeviceManagementRequest.getServices(includeCapability)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetServicesResponse.fromJson(envelope.body.response!).services;
  }

  /// This operation gets the device system date and time. The device shall
  /// support the return of the daylight saving setting and of the manual system
  /// date and time (if applicable) or indication of NTP time (if applicable)
  /// through the [getSystemDateAndTime] command.
  ///
  /// A device shall provide the UTC [DateTime] information.
  Future<SystemDateAndTime> getSystemDateAndTime() async {
    loggy.debug('getSystemDateAndTime');

    final envelope = await transport.sendRequest(
        uri,
        transport.envelope(
            null, soap.DeviceManagementRequest.systemDateAndTime()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetSystemDateAndTimeResponse.fromJson(envelope.body.response!)
        .systemDateAndTime;
  }

  /// This operation is used to retrieve URIs from which system information may
  /// be downloaded using HTTP. URIs may be returned for the following system
  /// information:
  ///
  /// System Logs. Multiple system logs may be returned, of different types. The
  /// exact format of the system logs is outside the scope of this
  /// specification.
  ///
  /// Support Information. This consists of arbitrary device diagnostics
  /// information from a device. The exact format of the diagnostic information
  /// is outside the scope of this specification.
  ///
  /// System Backup. The received file is a backup file that can be used to
  /// restore the current device configuration at a later date. The exact format
  /// of the backup configuration file is outside the scope of this
  /// specification.
  ///
  /// If the device allows retrieval of system logs, support information or
  /// system backup data, it should make them available via HTTP GET. If it
  /// does, it shall support the GetSystemUris command.
  Future<GetSystemUrisResponse?> getSystemUris() async {
    loggy.debug('getSystemUris');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.DeviceManagementRequest.systemUris()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetSystemUrisResponse.fromJson(envelope.body.response!);
  }

  /// This operation lists the registered users and corresponding credentials on
  /// a device. The device shall support retrieval of registered device users
  /// and their credentials for the user token through the [getUsers] (GetUsers)
  /// command.
  Future<List<User>> getUsers() async {
    loggy.debug('getUsers');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.DeviceManagementRequest.getUsers()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetUsersResponse.fromJson(envelope.body.response!).users;
  }

  // //A client can ask for the device service endpoint reference address property
  // //that can be used to derive the password equivalent for remote user
  // //operation. The device shall support the [getEndpointReference] command
  // //returning the address property of the device service endpoint reference.
  // // Future<void> getEndpointReference() async {
  // //   // Future<GetEndpointReferenceResponse> getEndpointReference() async {
  // //   final envelope = await Soap.retrieveEnvelope(
  // //       uri, onvif.secureRequest(SoapRequest.endpointReference()),
  // //       postProcess: (String xmlBody, dynamic jsonMap, Envelope envelope) {
  // //     print(xmlBody);
  // //     print('\n\n');
  // //     print(jsonMap);
  // //   });

  // //   // if (envelope.body.endpointReferenceResponse == null) throw Exception();

  // //   // return envelope.body.deviceInformationResponse!;
  // // }
}
