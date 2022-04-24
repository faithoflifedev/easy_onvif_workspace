import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:easy_onvif/onvif.dart';

class OnvifPtzCommand extends Command {
  @override
  String get description => 'PTZ commands.';

  @override
  String get name => 'ptz';

  OnvifPtzCommand() {
    addSubcommand(OnvifAbsoluteMovePtzCommand());
  }
}

///Operation to move pan,tilt or zoom to a absolute destination.
///
///The speed argument is optional. If an x/y speed value is given it is up to
///the device to either use the x value as absolute resoluting speed vector or
///to map x and y to the component speed. If the speed argument is omitted, the
///default speed set by the PTZConfiguration will be used.
class OnvifAbsoluteMovePtzCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'Operation to move pan,tilt or zoom to a absolute destination.';

  @override
  String get name => 'absolute-move';

  @override
  void run() async {
    await initializeOnvif();

    try {
      // await ptz.absoluteMove(profileToken, place);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
