import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:easy_onvif/util.dart';
import 'package:loggy/loggy.dart';
import 'package:easy_onvif/probe.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import '../command.dart';

class OnvifProbeCommand extends Command {
  @override
  String get description => 'Probe/device discovery command.';

  @override
  String get name => 'probe';

  OnvifProbeCommand() {
    addSubcommand(OnvifListDevicesProbeCommand());
    addSubcommand(OnvifProxyProbeCommand());
  }
}

/// `DevicesController` is a class that is used to define the routes for an API that would allow a client to get device data from the server in cases that the client and server are on separate networks.
/// [multicastProbe] is a reference to the multicast probe that is used to discover devices.
class DevicesController {
  final multicastProbe = MulticastProbe();

  /// Initialize the controller by probing for devices.
  DevicesController() {
    _init();
  }

  void _init() async => await multicastProbe.probe();

  // Define our getter for our handler which resolves to a shelf handler that will respond to client requests.
  Handler get handler {
    final router = Router();

    router.get(
        '/list',
        (Request request) => Response.ok(
              json.encode(multicastProbe.onvifDevices),
              headers: {'Content-type': 'application/json'},
            ));

    router.all(
        '/refresh',
        (Request request) => Response.ok(
              {'success': 'true'},
              headers: {'Content-type': 'application/json'},
            ));

    return router.call;
  }
}

class OnvifListDevicesProbeCommand extends OnvifHelperCommand {
  @override
  String get description => 'Probe/device discovery command.';

  @override
  String get name => 'list-devices';

  OnvifListDevicesProbeCommand() {
    argParser.addOption('timeout',
        abbr: 't',
        valueHelp: 'number',
        defaultsTo: '${MulticastProbe.defaultTimeout}',
        help:
            'The number of seconds to accept probe responses from devices.  Ignored of --start-proxy-server is set.');
  }

  @override
  void run() async {
    final timeout = int.parse(argResults!['timeout']);

    if (timeout < 1) {
      throw UsageException(
          'API usage error:', 'timeout must be greater than zero');
    }

    final multicastProbe = MulticastProbe();

    await multicastProbe.probe();

    print(multicastProbe.onvifDevices);
  }
}

class OnvifProxyProbeCommand extends OnvifHelperCommand {
  final _defaultIp = '0.0.0.0';

  @override
  String get description =>
      'ws-discovery proxy to allow access to device info through a VPN';

  @override
  String get name => 'proxy';

  OnvifProxyProbeCommand() {
    argParser
      ..addOption('port',
          abbr: 'p',
          valueHelp: 'number',
          defaultsTo: '8080',
          help: 'The HTTP port used to connect to this server.')
      ..addOption('bind-ip',
          valueHelp: 'IP address ',
          defaultsTo: _defaultIp,
          help: 'The IP address the server will listen on.');
  }

  @override
  void run() async {
    Loggy.initLoggy(
        logPrinter: const PrettyPrinter(
          showColors: false,
        ),
        logOptions: OnvifUtil.convertToLogOptions(globalResults!['log-level']));

    var server = await io.serve(
      DevicesController().handler,
      argResults!['bind-ip'],
      int.parse(argResults!['port']),
    );

    if (argResults!['bind-ip'] == _defaultIp) {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          logInfo('Serving at http://${addr.address}:${server.port}');
        }
      }
    } else {
      logInfo('Serving at http://${server.address.host}:${server.port}');
    }
  }
}
