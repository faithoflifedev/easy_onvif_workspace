import 'dart:convert';

import 'package:args/command_runner.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:universal_io/io.dart';

abstract class OnvifHelperCommand extends Command {
  Onvif? _onvif;

  Onvif get onvif => _onvif!;

  DeviceManagement get deviceManagement => onvif.deviceManagement;

  Ptz get ptz => onvif.ptz;

  Media get media => onvif.media;

  Future<void> initializeOnvif() async {
    final authFile = File(globalResults?['config-file']);

    if (!authFile.existsSync()) {
      throw Exception('Authentication file not found');
    }

    final auth = json.decode(authFile.readAsStringSync());

    //configure device connection
    _onvif = await Onvif.connect(
        host: auth['host'],
        username: auth['username'],
        password: auth['password']);
  }
}
