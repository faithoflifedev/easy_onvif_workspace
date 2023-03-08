import 'dart:convert';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:easy_onvif/command.dart';
import 'package:easy_onvif/device_management.dart';
import 'package:easy_onvif/util.dart';
import 'package:universal_io/io.dart';
import 'package:yaml/yaml.dart';

///device management
class OnvifDeviceManagementCommand extends Command {
  @override
  String get description => 'Device management commands.';

  @override
  String get name => 'device-management';

  OnvifDeviceManagementCommand() {
    addSubcommand(OnvifCreateUsersDeviceManagementCommand());
    addSubcommand(OnvifDeleteUsersDeviceManagementCommand());
    addSubcommand(OnvifGetCapabilitiesDeviceManagementCommand());
    addSubcommand(OnvifGetDiscoveryModeDeviceManagementCommand());
    addSubcommand(OnvifGetDeviceInformationResponseDeviceManagementCommand());
    addSubcommand(OnvifGetDnsDeviceManagementCommand());
    addSubcommand(OnvifGetHostnameDeviceManagementCommand());
    addSubcommand(OnvifGetNetworkProtocolsDeviceManagementCommand());
    addSubcommand(OnvifGetNtpDeviceManagementCommand());
    addSubcommand(OnvifGetServiceCapabilitiesDeviceManagementCommand());
    addSubcommand(OnvifGetServicesDeviceManagementCommand());
    addSubcommand(OnvifGetSystemDateAndTimeDeviceManagementCommand());
    addSubcommand(OnvifGetSystemUrisDeviceManagementCommand());
    addSubcommand(OnvifGetUsersDeviceManagementCommand());
  }
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
class OnvifCreateUsersDeviceManagementCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This operation creates new device users and corresponding credentials on a device for authentication purposes. The device shall support creation of device users and their credentials through the CreateUsers command. Either all users are created successfully or a fault message shall be returned without creating any user.';

  @override
  String get name => 'create-users';

  OnvifCreateUsersDeviceManagementCommand() {
    argParser
      ..addOption('users-file',
          abbr: 'f',
          valueHelp: 'yaml or json file path',
          help:
              'The path to the file that lists users to be created, cannot be used with other options.')
      ..addOption(
        'username',
        abbr: 'u',
        valueHelp: 'string',
        help: 'Username string.',
      )
      ..addOption(
        'password',
        abbr: 'p',
        valueHelp: 'string',
        help: 'Password string.',
      )
      ..addOption(
        'user-level',
        abbr: 'l',
        valueHelp: 'enum',
        allowed: UserLevel.values.map((userLevel) => userLevel.name).toList(),
        help: 'User level string.',
      );
  }

  @override
  void run() async {
    await initializeOnvif();

    final users = <User>[];

    final hasFile = argResults?.options.contains('users-file') ?? false;

    final hasUser = (argResults?.options.contains('username') ?? false) &&
        (argResults?.options.contains('user-level') ?? false);

    if (hasFile) {
      final userFile = File(argResults!['users-file']);

      if (!userFile.existsSync()) {
        throw UsageException(
            '${argResults!['users-file']} - file not found', usage);
      }

      users.addAll((loadYaml(userFile.readAsStringSync()) as YamlList)
          .map((userJson) => User.fromYamlMap(userJson))
          .toList());
    }

    if (hasUser) {
      users.add(User(
        username: argResults!['username'],
        password: argResults?['password'],
        userLevel: UserLevel.values.byName(argResults!['user-level']),
      ));
    }

    try {
      if (hasUser || hasFile) {
        await deviceManagement.createUsers(users);
      } else {
        throw UsageException('User information required.', usage);
      }
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// This operation deletes the given storage configuration and configuration
/// change shall always be persistent.
class OnvifDeleteUsersDeviceManagementCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This operation deletes the given storage configuration and configuration change shall always be persistent.';

  @override
  String get name => 'delete-users';

  OnvifDeleteUsersDeviceManagementCommand() {
    argParser
      ..addOption('users-file',
          abbr: 'f',
          valueHelp: 'yaml or json file path',
          help:
              'The path to the file that lists users to be created, cannot be used with other options.')
      ..addOption(
        'username',
        abbr: 'u',
        valueHelp: 'string',
        help: 'Username string.',
      );
  }

  @override
  void run() async {
    await initializeOnvif();

    final users = <String>[];

    final hasFile = argResults?.options.contains('users-file') ?? false;

    final hasUser = argResults?.options.contains('username') ?? false;

    if (hasFile) {
      final userFile = File(argResults!['users-file']);

      if (!userFile.existsSync()) {
        throw UsageException(
            '${argResults!['users-file']} - file not found', usage);
      }

      users.addAll((loadYaml(File(argResults!['users-file']).readAsStringSync())
              as YamlList)
          .map((userJson) => userJson.toString()));
    }

    if (hasUser) {
      users.add(argResults!['username']);
    }

    try {
      await deviceManagement.deleteUsers(users);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

///This method has been replaced by the more generic GetServices method. For
///capabilities of individual services refer to the GetServiceCapabilities
///methods.
@Deprecated('Use OnvifGetServicesDeviceManagementCommand')
class OnvifGetCapabilitiesDeviceManagementCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This method has been replaced by the more generic GetServices method. For capabilities of individual services refer to the GetServiceCapabilities methods.';

  @override
  String get name => 'get-capabilities';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final capabilities = await deviceManagement.getCapabilities();

      print(capabilities);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

///This operation gets basic device information from the device.
class OnvifGetDeviceInformationResponseDeviceManagementCommand
    extends OnvifHelperCommand {
  @override
  String get description =>
      'This operation gets basic device information from the device.';

  @override
  String get name => 'get-device-information';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final getDeviceInformationResponse =
          await deviceManagement.getDeviceInformation();

      print(getDeviceInformationResponse);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// This operation gets the discovery mode of a device. See Section 7.2 for the
/// definition of the different device discovery modes. The device shall support
/// retrieval of the discovery mode setting through the GetDiscoveryMode
/// command.
class OnvifGetDiscoveryModeDeviceManagementCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This operation gets the discovery mode of a device. See Section 7.2 for the definition of the different device discovery modes. The device shall support retrieval of the discovery mode setting through the GetDiscoveryMode command.';

  @override
  String get name => 'get-discovery-mode';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final discoveryMode = await deviceManagement.getDiscoveryMode();

      print(discoveryMode);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// This operation gets the DNS settings from a device. The device shall return
/// its DNS configurations through the GetDNS command.
class OnvifGetDnsDeviceManagementCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This operation gets the DNS settings from a device. The device shall return its DNS configurations through the GetDNS command.';

  @override
  String get name => 'get-dns';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final dns = await deviceManagement.getDns();

      print(dns);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// This operation is used by an endpoint to get the hostname from a device. The
/// device shall return its hostname configurations through the GetHostname
/// command.
class OnvifGetHostnameDeviceManagementCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This operation is used by an endpoint to get the hostname from a device. The device shall return its hostname configurations through the GetHostname command.';

  @override
  String get name => 'get-hostname';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final hostnameInformation = await deviceManagement.getHostname();

      print(hostnameInformation);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

///This operation gets defined network protocols from a device. The device shall
///support the GetNetworkProtocols command returning configured network
///protocols.
class OnvifGetNetworkProtocolsDeviceManagementCommand
    extends OnvifHelperCommand {
  @override
  String get description =>
      'This operation gets defined network protocols from a device. The device shall support the GetNetworkProtocols command returning configured network protocols.';

  @override
  String get name => 'get-network-protocols';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final networkProtocols = await deviceManagement.getNetworkProtocols();

      print(json.encode(networkProtocols));
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// This operation gets the NTP settings from a device. If the device supports
/// NTP, it shall be possible to get the NTP server settings through the GetNTP
/// command.
class OnvifGetNtpDeviceManagementCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This operation gets defined network protocols from a device. The device shall support This operation gets the NTP settings from a device. If the device supports NTP, it shall be possible to get the NTP server settings through the GetNTP command.';

  @override
  String get name => 'get-ntp';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final ntpInformation = await deviceManagement.getNtp();

      print(ntpInformation);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// Returns the capabilities of the device service. The result is returned in a typed answer.
class OnvifGetServiceCapabilitiesDeviceManagementCommand
    extends OnvifHelperCommand {
  @override
  String get description =>
      'Returns the capabilities of the device service. The result is returned in a typed answer.';

  @override
  String get name => 'get-service-capabilities';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final deviceServiceCapabilities =
          await deviceManagement.getServiceCapabilities();

      print(deviceServiceCapabilities);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// Returns information about services on the device.
class OnvifGetServicesDeviceManagementCommand extends OnvifHelperCommand {
  @override
  String get description => 'Returns information about services on the device.';

  @override
  String get name => 'get-services';

  OnvifGetServicesDeviceManagementCommand() {
    argParser.addFlag('include-capability',
        abbr: 'i',
        defaultsTo: false,
        help:
            'Indicates if the service capabilities (untyped) should be included in the response.');
  }

  @override
  void run() async {
    await initializeOnvif();

    try {
      final services =
          await deviceManagement.getServices(argResults!['include-capability']);

      print(json.encode(services));
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// This operation gets the device system date and time. The device shall
/// support the return of the daylight saving setting and of the manual system
/// date and time (if applicable) or indication of NTP time (if applicable)
/// through the GetSystemDateAndTime command.
///
///A device shall provide the UTCDateTime information.
class OnvifGetSystemDateAndTimeDeviceManagementCommand
    extends OnvifHelperCommand {
  @override
  String get description =>
      '''This operation gets the device system date and time. The device shall support the return of the daylight saving setting and of the manual system date and time (if applicable) or indication of NTP time (if applicable) through the GetSystemDateAndTime command.

A device shall provide the UTCDateTime information.''';

  @override
  String get name => 'get-system-date-and-time';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final systemDateAndTime = await deviceManagement.getSystemDateAndTime();

      print(systemDateAndTime);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// This operation is used to retrieve URIs from which system information may be
/// downloaded using HTTP. URIs may be returned for the following system
/// information:
///
/// System Logs. Multiple system logs may be returned, of different types. The
/// exact format of the system logs is outside the scope of this specification.
///
/// Support Information. This consists of arbitrary device diagnostics
/// information from a device. The exact format of the diagnostic information is
/// outside the scope of this specification.
///
/// System Backup. The received file is a backup file that can be used to
/// restore the current device configuration at a later date. The exact format
/// of the backup configuration file is outside the scope of this specification.
///
/// If the device allows retrieval of system logs, support information or system
/// backup data, it should make them available via HTTP GET. If it does, it
/// shall support the GetSystemUris command.
class OnvifGetSystemUrisDeviceManagementCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This operation is used to retrieve URIs from which system information may be downloaded using HTTP';

  @override
  String get name => 'get-system-uris';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final getSystemUrisResponse = await deviceManagement.getSystemUris();

      print(getSystemUrisResponse);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// This operation lists the registered users and corresponding credentials on a
/// device. The device shall support retrieval of registered device users and
/// their credentials for the user token through the GetUsers command.
class OnvifGetUsersDeviceManagementCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This operation lists the registered users and corresponding credentials on a device. The device shall support retrieval of registered device users and their credentials for the user token through the GetUsers command.';

  @override
  String get name => 'get-users';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final users = await deviceManagement.getUsers();

      print(json.encode(users));
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
