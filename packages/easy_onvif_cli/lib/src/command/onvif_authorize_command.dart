import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:onvif_cli/command.dart';

///Generate a refresh token used to authenticate the command line API requests
class OnvifAuthorizeCommand extends Command {
  @override
  String get description =>
      'Generate an authentication file for an Onvif device.';

  @override
  String get name => 'authorize';

  @override
  void run() async {
    final credFile = defaultConfigFile;

    final hasCred = credFile.existsSync();

    String? approval;

    final credentials = <String, dynamic>{};

    if (hasCred) {
      print('Do you want to overwrite the default credentials [y/n]:');

      approval = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);

      //use existing credentials from filesystem
      if (approval != null && approval.startsWith('n')) {
        final content = credFile.readAsStringSync();

        try {
          credentials.addAll(json.decode(content));
        } catch (exception) {
          stderr.write('Error reading the credentials file.\n');

          exit(64);
        }
      }
    }

    print('Host:');

    credentials['host'] =
        stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);

    print('Username:');

    credentials['username'] =
        stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);

    print('Password:');

    stdin.echoMode = false;

    credentials['password'] =
        stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);

    if (credentials['host'] == null ||
        credentials['username'] == null ||
        credentials['password'] == null) {
      throw Exception('Error: missing required data.');
    }

    credFile.createSync(recursive: true);

    credFile.writeAsString(json.encode(credentials));

    print('Authorization completed.');
  }
}
