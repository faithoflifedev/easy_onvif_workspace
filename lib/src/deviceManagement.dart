import 'package:easy_onvif/model/envelope.dart';
import 'package:easy_onvif/onvif.dart';

class DeviceManagement {
  final Onvif onvif;
  final String uri;

  DeviceManagement({required this.onvif, required this.uri});

  ///This operation creates new device users and corresponding credentials on a
  ///device for authentication purposes. The device shall support creation of
  ///device users and their credentials through the CreateUsers command. Either
  ///all users are created successfully or a fault message shall be returned
  ///without creating any user.
  ///
  ///ONVIF compliant devices are recommended to support password length of at
  ///least 28 bytes, as clients may follow the password derivation mechanism
  ///which results in 'password equivalent' of length 28 bytes, as described in
  ///section 3.1.2 of the ONVIF security white paper.
  //Future<CreateUsersResponse> createUsers(List<User> users) async {
  Future<void> createUsers(List<User> users) async {
    // final envelope = await Soap.retrieveEnvlope(

    print(uri);

    print(onvif
        .secureRequest(SoapRequest.createUsers(users))
        .toXmlString(pretty: true));

    await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.createUsers(users)),
        postProcess: (String xmlBody, dynamic jsonMap, Envelope envelope) {
      print(xmlBody);
      print('\n\n');
      print(jsonMap);
    });

    // if (envelope.body.usersResponse == null) throw Exception();

    // return envelope.body.usersResponse!;
  }

  ///This method has been replaced by the more generic [getServices] method. For
  ///capabilities of individual services refer to the [getServiceCapabilities]
  ///methods.
  Future<Capabilities> getCapabilities({String category = 'All'}) async {
    final envelope = await Soap.retrieveEnvlope(
        uri, SoapRequest.envelope(null, SoapRequest.capabilities(category)));

    if (envelope.body.capabilitiesResponse == null) throw Exception();

    return envelope.body.capabilitiesResponse!.capabilities;
  }

  ///This operation gets basic device information from the device.
  Future<GetDeviceInformationResponse> getDeviceInformation() async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.deviceInformation()));

    if (envelope.body.deviceInformationResponse == null) throw Exception();

    return envelope.body.deviceInformationResponse!;
  }

  //This operation is used by an endpoint to get the hostname from a device. The
  //device shall return its hostname configurations through the [getHostname]
  Future<HostnameInformation> getHostname() async {
    final envelope = await Soap.retrieveEnvlope(
      uri,
      SoapRequest.envelope(null, SoapRequest.hostname()),
    );

    if (envelope.body.hostnameResponse == null) throw Exception();

    return envelope.body.hostnameResponse!.hostnameInformation;
  }

  ///This operation gets defined network protocols from a device. The device
  ///shall support the [getNetworkProtocols] command returning configured
  ///network protocols.
  Future<List<NetworkProtocol>> getNetworkProtocols() async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.networkProtocols()));

    if (envelope.body.networkProtocolsResponse == null) throw Exception();

    return envelope.body.networkProtocolsResponse!.networkProtocols;
  }

  ///This operation gets the NTP settings from a device. If the device supports
  ///NTP, it shall be possible to get the NTP server settings through the
  ///[getNtp] command.
  Future<NtpInformation> getNtp() async {
    final envelope =
        await Soap.retrieveEnvlope(uri, onvif.secureRequest(SoapRequest.ntp()));

    if (envelope.body.ntpResponse == null) throw Exception();

    return envelope.body.ntpResponse!.ntpInformation;
  }

  //A client can ask for the device service endpoint reference address property
  //that can be used to derive the password equivalent for remote user
  //operation. The device shall support the [getEndpointReference] command
  //returning the address property of the device service endpoint reference.
  // Future<void> getEndpointReference() async {
  //   // Future<GetEndpointReferenceResponse> getEndpointReference() async {
  //   final envelope = await Soap.retrieveEnvlope(
  //       uri, onvif.secureRequest(SoapRequest.endpointReference()),
  //       postProcess: (String xmlBody, dynamic jsonMap, Envelope envelope) {
  //     print(xmlBody);
  //     print('\n\n');
  //     print(jsonMap);
  //   });

  //   // if (envelope.body.endpointReferenceResponse == null) throw Exception();

  //   // return envelope.body.deviceInformationResponse!;
  // }

  ///Returns information about services on the device.
  Future<List<Service>> getServices() async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.services()));

    if (envelope.body.servicesResponse == null) throw Exception();

    return envelope.body.servicesResponse!.services;
  }

  ///Returns the capabilities of the device service. The result is returned in a
  ///typed answer.
  Future<void> getServiceCapabilities() async {
    // TODO: implement getServiceCapabilities
    throw UnimplementedError();
  }

  ///This operation gets the device system date and time. The device shall
  ///support the return of the daylight saving setting and of the manual system
  ///date and time (if applicable) or indication of NTP time (if applicable)
  ///through the [getSystemDateAndTime] command.
  ///
  ///A device shall provide the UTC [DateTime] information.
  Future<SystemDateAndTime> getSystemDateAndTime() async {
    final envelope = await Soap.retrieveEnvlope(
        uri, SoapRequest.envelope(null, SoapRequest.systemDateAndTime()));

    if (envelope.body.dateTimeResponse == null) throw Exception();

    return envelope.body.dateTimeResponse!.systemDateAndTime;
  }

  ///This operation is used to retrieve URIs from which system information may
  ///be downloaded using HTTP. URIs may be returned for the following system
  ///information:
  ///
  ///System Logs. Multiple system logs may be returned, of different types. The
  ///exact format of the system logs is outside the scope of this specification.
  ///
  ///Support Information. This consists of arbitrary device diagnostics
  ///information from a device. The exact format of the diagnostic information
  ///is outside the scope of this specification.
  ///
  ///System Backup. The received file is a backup file that can be used to
  ///restore the current device configuration at a later date. The exact format
  ///of the backup configuration file is outside the scope of this
  ///specification.
  ///
  ///If the device allows retrieval of system logs, support information or
  ///system backup data, it should make them available via HTTP GET. If it does,
  ///it shall support the GetSystemUris command.
  Future<GetSystemUrisResponse> getSystemUris() async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.systemUris()));

    if (envelope.body.systemUrisResponse == null) throw Exception();

    return envelope.body.systemUrisResponse!;
  }

  ///This operation lists the registered users and corresponding credentials on
  ///a device. The device shall support retrieval of registered device users and
  ///their credentials for the user token through the [getUsers] (GetUsers)
  ///command.
  Future<List<User>> getUsers() async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.users()));

    if (envelope.body.usersResponse == null) throw Exception();

    return envelope.body.usersResponse!.users;
  }
}
