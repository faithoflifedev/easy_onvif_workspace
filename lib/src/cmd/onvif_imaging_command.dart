import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:easy_onvif/command.dart';
import 'package:easy_onvif/util.dart';

class OnvifImagingCommand extends Command {
  @override
  String get description => 'Imaging commands.';

  @override
  String get name => 'imaging';

  OnvifImagingCommand() {
    addSubcommand(OnvifGetCurrentPresetImagingCommand());
    addSubcommand(OnvifGetPresetsImagingCommand());
    addSubcommand(OnvifGetServiceCapabilitiesImagingCommand());
    addSubcommand(OnvifGetStatusImagingCommand());
  }
}

/// Via this command the last Imaging Preset applied can be requested. If the
/// camera configuration does not match any of the existing Imaging Presets, the
/// output of GetCurrentPreset shall be Empty. GetCurrentPreset shall return 0
/// if Imaging Presets are not supported by the Video Source.
class OnvifGetCurrentPresetImagingCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'Via this command the last Imaging Preset applied can be requested. If the camera configuration does not match any of the existing Imaging Presets, the output of GetCurrentPreset shall be Empty. GetCurrentPreset shall return 0 if Imaging Presets are not supported by the Video Source.';

  @override
  String get name => 'get-current-preset';

  OnvifGetCurrentPresetImagingCommand() {
    argParser.addOption('video-source-token',
        abbr: 't',
        valueHelp: 'token',
        mandatory: true,
        help:
            'A reference to the VideoSource where the operation should take place.');
  }

  @override
  void run() async {
    await initializeOnvif();

    try {
      final preset =
          await imaging.getCurrentPreset(argResults!['video-source-token']);

      print(preset);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// Via this command the list of available Imaging Presets can be requested.
class OnvifGetPresetsImagingCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'Via this command the list of available Imaging Presets can be requested.';

  @override
  String get name => 'get-presets';

  OnvifGetPresetsImagingCommand() {
    argParser
      ..addOption('video-source-token',
          abbr: 't',
          valueHelp: 'token',
          mandatory: true,
          help:
              'A reference to the VideoSource where the operation should take place.')
      ..addOption('limit',
          defaultsTo: '10',
          valueHelp: 'int',
          help: 'Limit the number of presets returned');
  }

  @override
  void run() async {
    await initializeOnvif();

    try {
      final presets = await imaging.getPresets(
        argResults!['video-source-token'],
        limit: int.tryParse(argResults?['limit']),
      );

      print(presets);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// Returns the capabilities of the imaging service. The result is returned in a typed answer.
class OnvifGetServiceCapabilitiesImagingCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'Returns the capabilities of the imaging service. The result is returned in a typed answer.';

  @override
  String get name => 'get-service-capabilities';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final capabilities = await imaging.getServiceCapabilities();

      print(capabilities);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// Via this command the current status of the Move operation can be requested.
/// Supported for this command is available if the support for the Move
/// operation is signalled via GetMoveOptions.
class OnvifGetStatusImagingCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'Via this command the current status of the Move operation can be requested. Supported for this command is available if the support for the Move operation is signalled via GetMoveOptions.';

  @override
  String get name => 'get-status';

  OnvifGetStatusImagingCommand() {
    argParser.addOption('video-source-token',
        abbr: 't',
        valueHelp: 'token',
        mandatory: true,
        help:
            'Reference token to the VideoSource where the imaging status should be requested.');
  }

  @override
  void run() async {
    await initializeOnvif();

    try {
      final imagingStatus =
          await imaging.getStatus(argResults!['video-source-token']);

      print(imagingStatus);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
