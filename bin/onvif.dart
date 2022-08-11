import 'package:args/command_runner.dart';
import 'package:easy_onvif/util/meta_update.dart';
import 'package:easy_onvif/util/meta.dart';
import 'package:universal_io/io.dart';
import 'package:easy_onvif/onvif.dart';

void main(List<String> arguments) async {
  MetaUpdate('pubspec.yaml').verifyLatestVersionFromPubSpec();

  CommandRunner('onvif',
      '''A command line interface for controlling Onvif compliant devices

Using Dart package: ${meta['name']} v${meta['version']}''')
    ..argParser.addOption('config-file',
        defaultsTo: '${OnvifUtil.userHome}/.onvif/credentials.json')
    ..argParser.addOption('log-level',
        allowed: ['all', 'debug', 'info', 'warning', 'error', 'off'],
        defaultsTo: 'off')
    ..addCommand(OnvifAuthorizeCommand())
    ..addCommand(OnvifDeviceManagementCommand())
    ..addCommand(OnvifMediaCommand())
    ..addCommand(OnvifPtzCommand())
    ..addCommand(OnvifProbeCommand())
    ..addCommand(OnvifVersionCommand())
    ..run(arguments).catchError((error) {
      if (error is! UsageException) throw error;

      print(error);

      exit(64); // Exit code 64 indicates a usage error.
    });
}
