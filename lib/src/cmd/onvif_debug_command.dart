import 'dart:async';
import 'dart:math';

import 'package:archive/archive_io.dart';
import 'package:args/command_runner.dart';
import 'package:cli_spin/cli_spin.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/src/model/device_management/user.dart';
import 'package:easy_onvif/src/model/media1/stream_setup.dart';
import 'package:easy_onvif/src/model/media1/transport.dart';
import 'package:easy_onvif/util.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';
import 'package:yaml/yaml.dart';

///Generate a refresh token used to authenticate the command line API requests
class OnvifDebugCommand extends Command with UiLoggy {
  @override
  String get description => 'Generate a debug bundle for an Onvif device.';

  @override
  String get name => 'debug';

  OnvifDebugCommand() {
    argParser.addOption(
      'output-folder',
      abbr: 'o',
      valueHelp: 'file path',
      help: 'destination folder for debug bundle',
      defaultsTo: 'debug',
    );
  }

  @override
  void run() async {
    // create temp folder named by device name
    // get responses into xml files named by response type
    // zip up folder and output to --output

    var folderName = argResults?['output-folder'] ?? 'debug';

    if (!p.isAbsolute(folderName)) {
      folderName = p.join(Directory.current.path, folderName);
    }

    final filePath = p.join(folderName, 'debug.txt');

    final zipFile = File(p.join(folderName, 'debug.zip'));

    final config = loadYaml(OnvifUtil.defaultConfigFile.readAsStringSync());

    // configure device connection
    final onvif = await Onvif.connect(
        host: config['host'],
        username: config['username'],
        password: config['password'],
        logOptions: const LogOptions(
          LogLevel.debug,
          stackTraceLevel: LogLevel.error,
        ),
        printer: FilePrinter(
          filePath: filePath,
        ));

    final spinner = CliSpin(
      text: 'Loading data...',
      spinner: CliSpinners.line,
    ).start(); // Chai

    final random = Random().nextInt(900000) + 100000;

    Timer(Duration(milliseconds: 1000), () {
      // Change spinner color
      spinner.color = CliSpinnerColor.yellow;

      // Change spinner text
      spinner.text = 'Still loading, please wait...';
    });

    //
    // get device management information
    //

    try {
      await onvif.deviceManagement.getCapabilities();
    } catch (e) {
      loggy.error('getCapabilities');
    }

    try {
      await onvif.deviceManagement.getDeviceInformation();
    } catch (e) {
      loggy.error('getDeviceInformation');
    }

    try {
      await onvif.deviceManagement.getDiscoveryMode();
    } catch (e) {
      loggy.error('getDiscoveryMode');
    }

    try {
      await onvif.deviceManagement.getDns();
    } catch (e) {
      loggy.error('getDns');
    }

    try {
      await onvif.deviceManagement.getHostname();
    } catch (e) {
      loggy.error('getHostname');
    }

    try {
      await onvif.deviceManagement.getNetworkProtocols();
    } catch (e) {
      loggy.error('getNetworkProtocols');
    }

    try {
      await onvif.deviceManagement.getNtp();
    } catch (e) {
      loggy.error('getNtp');
    }

    try {
      await onvif.deviceManagement.getServiceCapabilities();
    } catch (e) {
      loggy.error('getServiceCapabilities');
    }

    try {
      await onvif.deviceManagement.getServices();
    } catch (e) {
      loggy.error('getServices');
    }

    try {
      await onvif.deviceManagement.getSystemDateAndTime();
    } catch (e) {
      loggy.error('getSystemDateAndTime');
    }

    try {
      await onvif.deviceManagement.getSystemLog('System');
    } catch (e) {
      loggy.error('getSystemDateAndTime');
    }

    try {
      await onvif.deviceManagement.getSystemUris();
    } catch (e) {
      loggy.error('getSystemUris');
    }

    try {
      await onvif.deviceManagement.getUsers();
    } catch (e) {
      loggy.error('getUsers');
    }

    try {
      await onvif.deviceManagement.createUsers([
        User(
            username: 'deleteMe_$random',
            password: 'deleteMe',
            userLevel: UserLevel.user)
      ]);
    } catch (e) {
      loggy.error('getUsers');
    }

    try {
      await onvif.deviceManagement.deleteUsers(['deleteMe_$random']);
    } catch (e) {
      loggy.error('getUsers');
    }

    //
    // get media1 information
    //

    try {
      await onvif.media.media1.getAudioSources();
    } catch (e) {
      loggy.error('getAudioSources');
    }

    try {
      var metadataConfigurations =
          await onvif.media.media1.getMetadataConfigurations();

      await onvif.media.media1
          .getMetadataConfiguration(metadataConfigurations.first.token);
    } catch (e) {
      loggy.error('getMetadataConfigurations');
      loggy.error('getMetadataConfiguration');
    }

    try {
      var profiles = await onvif.media.media1.getProfiles();

      await onvif.media.media1.getProfile(profiles.first.token);

      await onvif.media.media1.getSnapshotUri(profiles.first.token);

      await onvif.media.media1.getStreamUri(
        profiles.first.token,
        streamSetup: StreamSetup(
          stream: 'RTP-Unicast',
          transport: Transport(
            protocol: 'RTSP',
          ),
        ),
      );

      await onvif.media.media1.startMulticastStreaming(profiles.first.token);

      await onvif.media.media1.stopMulticastStreaming(profiles.first.token);
    } catch (e) {
      loggy.error('getProfiles');
      loggy.error('getProfile');
      loggy.error('getSnapshotUri');
      loggy.error('getStreamUri');
      loggy.error('startMulticastStreaming');
      loggy.error('stopMulticastStreaming');
    }

    try {
      await onvif.media.media1.getServiceCapabilities();
    } catch (e) {
      loggy.error('getServiceCapabilities');
    }

    try {
      await onvif.media.media1.getVideoSources();
    } catch (e) {
      loggy.error('getVideoSources');
    }

    //
    // get media2 information
    //

    try {
      await onvif.media.media2.getMetadataConfigurationOptions();
    } catch (e) {
      loggy.error('getMetadataConfigurationOptions');
    }

    try {
      await onvif.media.media2.getMetadataConfigurations();
    } catch (e) {
      loggy.error('getMetadataConfigurations');
    }

    try {
      var profiles = await onvif.media.media2.getProfiles();

      var videoEncoderConfiguration =
          profiles.first.configurations?.videoEncoderConfiguration;

      var videoSourceConfiguration =
          profiles.first.configurations?.videoSourceConfiguration;

      await onvif.media.media2.getSnapshotUri(profiles.first.token);

      await onvif.media.media2.getStreamUri(
        profiles.first.token,
        protocol: 'RTSP',
        streamType: 'RTP-Unicast',
      );

      await onvif.media.media2.startMulticastStreaming(profiles.first.token);

      await onvif.media.media2.stopMulticastStreaming(profiles.first.token);

      if (videoEncoderConfiguration != null) {
        await onvif.media.media2
            .getVideoEncoderInstances(videoEncoderConfiguration.token);
      }

      if (videoSourceConfiguration != null) {
        await onvif.media.media2.getVideoSourceConfigurationOptions(
            configurationToken: videoSourceConfiguration.token);
      }
    } catch (e) {
      loggy.error('getProfiles');
      loggy.error('getSnapshotUri');
      loggy.error('getStreamUri');
      loggy.error('startMulticastStreaming');
      loggy.error('stopMulticastStreaming');
      loggy.error('getVideoEncoderInstances');
      loggy.error('getVideoSourceConfigurationOptions');
    }

    try {
      await onvif.media.media2.getServiceCapabilities();
    } catch (e) {
      loggy.error('getServiceCapabilities');
    }

    try {
      await onvif.media.media2.getVideoEncoderConfigurations();
    } catch (e) {
      loggy.error('getVideoEncoderConfigurations');
    }

    try {
      await onvif.media.media2.getVideoSourceConfigurationOptions();
    } catch (e) {
      loggy.error('getServiceCapabilities');
    }

    //
    // get ptz information
    //

    try {
      var profiles = await onvif.media.media1.getProfiles();

      var profileToken = profiles.first.token;

      await onvif.ptz.absoluteMove(
        profileToken,
        position: PtzVector(
          panTilt: Vector2D(x: 0, y: 0),
          zoom: Vector1D(x: 0),
        ),
      );

      await onvif.ptz.continuousMove(
        profileToken,
        velocity: PtzSpeed(
          panTilt: Vector2D(x: 0.1, y: 0.1),
          zoom: Vector1D(x: 0),
        ),
      );

      var configurations =
          await onvif.ptz.getCompatibleConfigurations(profileToken);

      await onvif.ptz.getConfigurationOptions(configurations.first.token);
    } catch (e) {
      loggy.error('absoluteMove');
      loggy.error('continuousMove');
      loggy.error('getCompatibleConfigurations');
      loggy.error('getConfigurationOptions');
    }

    try {
      await onvif.ptz.getServiceCapabilities();
    } catch (e) {
      loggy.error('getServiceCapabilities');
    }

    try {
      await onvif.ptz.getConfigurations();
    } catch (e) {
      loggy.error('getConfigurations');
    }

    //
    // done with checks
    //

    final archive = Archive();

    archive.addFile(ArchiveFile(
      filePath,
      File(filePath).lengthSync(),
      File(filePath).readAsBytesSync(),
    ));

    final zipData = ZipEncoder().encode(archive);

    if (zipFile.existsSync()) {
      zipFile.deleteSync();
    }

    zipFile.writeAsBytesSync(zipData!);

    spinner.success('Bundle created successfully.');
  }
}
