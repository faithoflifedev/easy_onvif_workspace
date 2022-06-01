import 'package:args/command_runner.dart';
import 'package:universal_io/io.dart';
import 'package:easy_onvif/onvif.dart';

void main(List<String> arguments) async {
  CommandRunner('onvif',
      'A command line interface for controlling Onvif compliant devices')
    ..argParser.addOption('config-file',
        defaultsTo: '${OnvifUtil.userHome}/.onvif/credentials.json')
    ..addCommand(OnvifAuthorizeCommand())
    ..addCommand(OnvifDeviceManagementCommand())
    ..addCommand(OnvifMediaCommand())
    ..addCommand(OnvifPtzCommand())
    ..addCommand(OnvifProbeCommand())
    ..run(arguments).catchError((error) {
      if (error is! UsageException) throw error;

      print(error);

      exit(64); // Exit code 64 indicates a usage error.
    });
}
