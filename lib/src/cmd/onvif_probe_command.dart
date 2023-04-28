import 'dart:convert';

import 'package:args/command_runner.dart';
import 'package:easy_onvif/command.dart';
import 'package:easy_onvif/src/multicast_probe.dart';
import 'package:easy_onvif/util.dart';
import 'package:loggy/loggy.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

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

class OnvifListDevicesProbeCommand extends OnvifHelperCommand {
  @override
  String get description => 'Probe/device discovery command.';

  @override
  String get name => 'list-devices';

  OnvifListDevicesProbeCommand() {
    argParser
      ..addOption('timeout',
          abbr: 't',
          valueHelp: 'number',
          defaultsTo: '${MulticastProbe.defaultTimeout}',
          help:
              'The number of seconds to accept probe responses from devices.  Ignored of --start-proxy-server is set.')
      ..addFlag('start-proxy-server',
          help:
              'Start a web server that can proxy device information through a VPN');
  }

  @override
  void run() async {
    Loggy.initLoggy(
        logPrinter: const PrettyPrinter(
          showColors: false,
        ),
        logOptions: OnvifUtil.convertToLogOptions(globalResults!['log-level']));

    final timeout = int.parse(argResults!['timeout']);

    if (timeout < 1) {
      throw UsageException(
          'API usage error:', 'timeout must be greater than zero');
    }

    final multicastProbe = MulticastProbe();

    await multicastProbe.probe();

    if (argResults!['start-proxy-server']) {
      final server = await shelf_io.serve(
          (Request request) => Response.ok(
                json.encode(multicastProbe.onvifDevices),
                headers: {'Content-type': 'application/json'},
              ),
          '0.0.0.0',
          8080);

      // Enable content compression
      server.autoCompress = true;

      logInfo('Serving at http://${server.address.host}:${server.port}');
    } else {
      print(multicastProbe.onvifDevices);
    }
  }
}

class OnvifProxyProbeCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'ws-discovery proxy to allow access to device info through a VPN';

  @override
  String get name => 'proxy';

  @override
  void run() async {}
}
