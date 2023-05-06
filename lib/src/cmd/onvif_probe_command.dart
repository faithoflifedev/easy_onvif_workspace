import 'dart:io';

import 'package:annotated_shelf/annotated_shelf.dart';
import 'package:args/command_runner.dart';
import 'package:easy_onvif/command.dart';
import 'package:easy_onvif/probe.dart';
import 'package:easy_onvif/src/multicast_probe.dart';
import 'package:easy_onvif/util.dart';
import 'package:loggy/loggy.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

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

@RestAPI(baseUrl: '')
class DevicesAdaptor {
  final multicastProbe = MulticastProbe();

  DevicesAdaptor() {
    _init();
  }

  void _init() async => await multicastProbe.probe();

  @GET(url: '/list')
  List<ProbeMatch> getAllItems(Request request) => multicastProbe.onvifDevices;

  @GET(url: '/refresh')
  Future<RestResponse> refresh() async =>
      RestResponse(200, {'msj': 'ok'}, 'application/json');
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

    final router = await mount(DevicesAdaptor(), Cascade());

    var server = await io.serve(
      router.handler,
      argResults!['bind-ip'],
      argResults!['port'],
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
