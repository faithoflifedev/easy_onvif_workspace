import 'package:args/command_runner.dart';
import 'package:easy_onvif/util/meta.dart';

class OnvifVersionCommand extends Command {
  @override
  String get description => 'Display the package name and version.';

  @override
  String get name => 'version';

  @override
  void run() async {
    print('${meta['name']} v${meta['version']}');
  }
}
