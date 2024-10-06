import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:easy_onvif/media1.dart';
import 'package:easy_onvif/replay.dart';
import 'package:easy_onvif/util.dart';

import 'onvif_helper_command.dart';

/// replay
class OnvifReplayCommand extends Command {
  @override
  String get description => 'Replay commands.';

  @override
  String get name => 'replay';

  OnvifReplayCommand() {
    addSubcommand(OnvifGetReplayConfigurationReplayCommand());
    addSubcommand(OnvifGetReplayUriReplayCommand());
    addSubcommand(OnvifGetServiceCapabilitiesReplayCommand());
    addSubcommand(OnvifSetReplayConfigurationReplayCommand());
  }
}

/// Returns the current configuration of the replay service. This operation is mandatory.
class OnvifGetReplayConfigurationReplayCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'Returns the current configuration of the replay service. ';

  @override
  String get name => 'get-replay-configuration';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final replayConfiguration = await replay.getReplayConfiguration();

      print(replayConfiguration);
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// Requests a URI that can be used to initiate playback of a recorded stream
/// using RTSP as the control protocol. The URI is valid only as it is specified
/// in the response. A device supporting the Replay Service shall support the
/// GetReplayUri command.
class OnvifGetReplayUriReplayCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'Requests a URI that can be used to initiate playback of a recorded stream using RTSP as the control protocol';

  @override
  String get name => 'get-replay-uri';

  OnvifGetReplayUriReplayCommand() {
    argParser
      ..addOption('recording-token',
          abbr: 't',
          valueHelp: 'token',
          mandatory: true,
          help: 'The identifier of the recording to be streamed.')
      ..addOption('stream-setup-stream',
          defaultsTo: 'RTP-Unicast',
          valueHelp: 'stream type',
          allowed: ['RTP-Unicast', 'RTP-Multicast'],
          help: 'Defines if a multicast or unicast stream is requested')
      ..addOption('stream-setup-transport-protocol',
          defaultsTo: 'RTSP',
          valueHelp: 'transport protocol',
          allowed: ['UDP', 'TCP', 'RTSP', 'HTTP'],
          help:
              'Defines the network protocol for streaming, either UDP=RTP/UDP, RTSP=RTP/RTSP/TCP or HTTP=RTP/RTSP/HTTP/TCP');
  }

  @override
  void run() async {
    await initializeOnvif();

    try {
      final uri = await replay.getReplayUri(
        argResults!['recording-token'],
        streamSetup: StreamSetup(
            stream: argResults!['stream-setup-stream'],
            transport: Transport(
                protocol: argResults!['stream-setup-transport-protocol'])),
      );

      print(uri);
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// Returns the capabilities of the replay service. The result is returned in a
/// typed answer.
class OnvifGetServiceCapabilitiesReplayCommand extends OnvifHelperCommand {
  @override
  String get description => 'Returns the capabilities of the replay service.';

  @override
  String get name => 'get-service-capabilities';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final capabilities = await replay.getServiceCapabilities();

      print(capabilities);
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// Changes the current configuration of the replay service. This operation is
/// mandatory.
class OnvifSetReplayConfigurationReplayCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'Changes the current configuration of the replay service.';

  @override
  String get name => 'set-replay-configuration';

  OnvifSetReplayConfigurationReplayCommand() {
    argParser.addOption('session-timeout',
        abbr: 't',
        valueHelp: 'string',
        defaultsTo: 'PT60S',
        help: 'The RTSP session timeout.');
  }

  @override
  void run() async {
    await initializeOnvif();

    try {
      final capabilities = await replay.setReplayConfiguration(
          ReplayConfiguration(sessionTimeout: argResults!['session-timeout']));

      print(capabilities);
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
