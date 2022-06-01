import 'package:args/command_runner.dart';
import 'package:easy_onvif/onvif.dart';

class OnvifProbeCommand extends Command {
  @override
  String get description => 'Probe command.';

  @override
  String get name => 'probe';

  OnvifProbeCommand() {
    argParser.addOption('timeout',
        abbr: 't',
        valueHelp: 'number',
        defaultsTo: '5',
        help:
            'The number of seconds to accept probe responses.  Use -1 for "no timeout"');
  }

  @override
  void run() async {
    final onvifDevices = <ProbeMatch>[];

    await MulticastProbe.send(
        onReceive: (probeMatches) => onvifDevices.addAll(probeMatches),
        timeout: int.parse(argResults!['timeout']));

    print(onvifDevices);
  }
}
