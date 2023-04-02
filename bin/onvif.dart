import 'package:args/command_runner.dart';
import 'package:easy_onvif/command.dart';
import 'package:easy_onvif/util.dart';

import 'package:universal_io/io.dart';

void main(List<String> arguments) async {
  CommandRunner('onvif',
      'A command line interface for controlling Onvif compliant devices')
    ..argParser.addOption('config-file',
        defaultsTo: '${OnvifUtil.userHome}/.onvif/credentials.json')
    ..argParser.addOption('log-level',
        allowed: ['all', 'debug', 'info', 'warning', 'error', 'off'],
        defaultsTo: 'off')
    ..addCommand(OnvifAuthorizeCommand())
    ..addCommand(OnvifDeviceManagementCommand())
    ..addCommand(OnvifMedia1Command())
    ..addCommand(OnvifMedia2Command())
    ..addCommand(OnvifPtzCommand())
    ..addCommand(OnvifProbeCommand())
    ..addCommand(OnvifRecordingsCommand())
    ..addCommand(OnvifReplayCommand())
    ..addCommand(OnvifVersionCommand())
    ..run(arguments).catchError((error) {
      if (error is! UsageException) throw error;

      print(error);

      exit(64); // Exit code 64 indicates a usage error.
    });
}
