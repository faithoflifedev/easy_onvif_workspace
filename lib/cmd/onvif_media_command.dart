import 'dart:convert';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:easy_onvif/onvif.dart';

class OnvifMediaCommand extends Command {
  @override
  String get description => 'Media commands.';

  @override
  String get name => 'media';

  OnvifMediaCommand() {
    addSubcommand(OnvifGetAudioSourcesMediaCommand());
    addSubcommand(OnvifGetProfilesMediaCommand());
    addSubcommand(OnvifGetSnapshotUriMediaCommand());
    addSubcommand(OnvifGetStreamUriMediaCommand());
    addSubcommand(OnvifGetVideoSourcesMediaCommand());
    addSubcommand(OnvifStartMulticastStreamingMediaCommand());
    addSubcommand(OnvifStopMulticastStreamingMediaCommand());
  }
}

///This command lists all available physical audio inputs of the device.
class OnvifGetAudioSourcesMediaCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This command lists all available physical audio inputs of the device.';

  @override
  String get name => 'get-audio-sources';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final audioSources = await media.getAudioSources();

      print(json.encode(audioSources));
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

///Any endpoint can ask for the existing media profiles of a device using the
///GetProfiles command. Pre-configured or dynamically configured profiles can be
///retrieved using this command. This command lists all configured profiles in a
///device. The client does not need to know the media profile in order to use
///the command.
class OnvifGetProfilesMediaCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'Any endpoint can ask for the existing media profiles of a device using the GetProfiles command. Pre-configured or dynamically configured profiles can be retrieved using this command. This command lists all configured profiles in a device. The client does not need to know the media profile in order to use the command.';

  @override
  String get name => 'get-profiles';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final profiles = await media.getProfiles();

      print(json.encode(profiles));
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

///A client uses the GetSnapshotUri command to obtain a JPEG snapshot from the
///device. The returned URI shall remain valid indefinitely even if the profile
///is changed. The ValidUntilConnect, ValidUntilReboot and Timeout Parameter
///shall be set accordingly (ValidUntilConnect=false, ValidUntilReboot=false,
///timeout=PT0S). The URI can be used for acquiring a JPEG image through a HTTP
///GET operation. The image encoding will always be JPEG regardless of the
///encoding setting in the media profile. The Jpeg settings (like resolution or
///quality) may be taken from the profile if suitable. The provided image will
///be updated automatically and independent from calls to GetSnapshotUri.
class OnvifGetSnapshotUriMediaCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'A client uses the GetSnapshotUri command to obtain a JPEG snapshot from the device.';

  @override
  String get name => 'get-snapshot-uri';

  OnvifGetSnapshotUriMediaCommand() {
    argParser
      ..addOption('profile-token',
          abbr: 't',
          valueHelp: 'token',
          mandatory: true,
          help:
              'The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.')
      ..addFlag('valid-until-connect',
          defaultsTo: false,
          help:
              'Indicates if the Uri is only valid until the connection is established.')
      ..addFlag('valid-until-reboot',
          defaultsTo: false,
          help: 'Indicates if the Uri is invalid after a reboot of the device.')
      ..addOption('timeout',
          defaultsTo: 'PT0S', help: 'Duration how long the Uri is valid.');
  }

  @override
  void run() async {
    await initializeOnvif();

    try {
      final mediaUri = await media.getSnapshotUri(argResults!['profile-token'],
          validUntilConnect: argResults?['valid-until-connect'],
          validUntilReboot: argResults?['valid-until-reboot'],
          timeout: argResults?['timeout']);

      print(json.encode(mediaUri));
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

///This operation requests a URI that can be used to initiate a live media
///stream using RTSP as the control protocol. The returned URI shall remain
///valid indefinitely even if the profile is changed. The ValidUntilConnect,
///ValidUntilReboot and Timeout Parameter shall be set accordingly
///(ValidUntilConnect=false, ValidUntilReboot=false, timeout=PT0S).
///
///The correct syntax for the StreamSetup element for these media stream setups
///defined in 5.1.1 of the streaming specification are as follows:
///- RTP unicast over UDP: StreamType = "RTP_unicast", TransportProtocol = "UDP"
///- RTP over RTSP over HTTP over TCP: StreamType = "RTP_unicast",
///TransportProtocol = "HTTP"
///- RTP over RTSP over TCP: StreamType = "RTP_unicast", TransportProtocol = "RTSP"
///
///If a multicast stream is requested at least one of VideoEncoderConfiguration,
///AudioEncoderConfiguration and MetadataConfiguration shall have a valid
///multicast setting.
///
///For full compatibility with other ONVIF services a device should not generate
///Uris longer than 128 octets.
class OnvifGetStreamUriMediaCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This operation requests a URI that can be used to initiate a live media stream using RTSP as the control protocol';

  @override
  String get name => 'get-stream-uri';

  OnvifGetStreamUriMediaCommand() {
    argParser
      ..addOption('profile-token',
          abbr: 't',
          valueHelp: 'token',
          mandatory: true,
          help:
              'The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.')
      ..addOption('stream-type',
          defaultsTo: 'RTP_unicast',
          valueHelp: 'type',
          allowed: ['RTP-Unicast', 'RTP-Multicast'],
          help: 'Defines if a multicast or unicast stream is requested')
      ..addOption('transport-protocol',
          defaultsTo: 'RTSP',
          valueHelp: 'type',
          allowed: ['UDP', 'TCP', 'RTSP', 'HTTP'],
          help: 'Defines if a multicast or unicast stream is requested')
      ..addFlag('valid-until-connect',
          defaultsTo: false,
          help:
              'Indicates if the Uri is only valid until the connection is established.')
      ..addFlag('valid-until-reboot',
          defaultsTo: false,
          help: 'Indicates if the Uri is invalid after a reboot of the device.')
      ..addOption('timeout',
          defaultsTo: 'PT0S', help: 'Duration how long the Uri is valid.');
  }

  @override
  void run() async {
    await initializeOnvif();

    try {
      final mediaUri = await media.getStreamUri(argResults!['profile-token'],
          streamType: argResults?['stream-type'],
          transportProtocol: argResults?['transport-protocol'],
          validUntilConnect: argResults?['valid-until-connect'],
          validUntilReboot: argResults?['valid-until-reboot'],
          timeout: argResults?['timeout']);

      print(json.encode(mediaUri));
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

///This command lists all available physical video inputs of the device.
class OnvifGetVideoSourcesMediaCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This command lists all available physical video inputs of the device.';

  @override
  String get name => 'get-video-sources';

  @override
  void run() async {
    await initializeOnvif();

    try {
      final videoSources = await media.getVideoSources();

      print(videoSources);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

///This command starts multicast streaming using a specified media profile of a
///device. Streaming continues until StopMulticastStreaming is called for the
///same Profile. The streaming shall continue after a reboot of the device until
///a StopMulticastStreaming request is received. The multicast address, port and
///TTL are configured in the VideoEncoderConfiguration,
///AudioEncoderConfiguration and MetadataConfiguration respectively.
class OnvifStartMulticastStreamingMediaCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This command starts multicast streaming using a specified media profile of a device.';

  @override
  String get name => 'start-multicast-streaming';

  @override
  void run() async {
    await initializeOnvif();

    try {
      await media.startMulticastStreaming();
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// This command stop multicast streaming using a specified media profile of a device.
class OnvifStopMulticastStreamingMediaCommand extends OnvifHelperCommand {
  @override
  String get description =>
      'This command stop multicast streaming using a specified media profile of a device.';

  @override
  String get name => 'stop-multicast-streaming';

  @override
  void run() async {
    await initializeOnvif();

    try {
      await media.stopMulticastStreaming();
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
