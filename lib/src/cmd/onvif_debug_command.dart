import 'dart:async';

import 'package:archive/archive_io.dart';
import 'package:args/command_runner.dart';
import 'package:cli_spin/cli_spin.dart';
import 'package:easy_onvif/onvif.dart';
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

    Timer(Duration(milliseconds: 1000), () {
      // Change spinner color
      spinner.color = CliSpinnerColor.yellow;

      // Change spinner text
      spinner.text = 'Still loading, please wait...';
    });

    // get device management information

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
      await onvif.deviceManagement.getSystemUris();
    } catch (e) {
      loggy.error('getSystemUris');
    }

    try {
      await onvif.deviceManagement.getUsers();
    } catch (e) {
      loggy.error('getUsers');
    }

    // get media1 information

    try {
      await onvif.media.media1.getAudioSources();
    } catch (e) {
      loggy.error('getAudioSources');
    }

    // await onvif.media.media1.getMetadataConfiguration(configurationToken)

    try {
      await onvif.media.media1.getMetadataConfigurations();
    } catch (e) {
      loggy.error('getMetadataConfigurations');
    }

    // await onvif.media.media1.getProfile(profileToken);

    try {
      await onvif.media.media1.getProfiles();
    } catch (e) {
      loggy.error('getProfiles');
    }

    try {
      await onvif.media.media1.getServiceCapabilities();
    } catch (e) {
      loggy.error('getServiceCapabilities');
    }

    // await onvif.media.media1.getSnapshotUri(profileToken);

    // await onvif.media.media1
    //     .getStreamUri(profileToken, streamSetup: streamSetup);

    try {
      await onvif.media.media1.getVideoSources();
    } catch (e) {
      loggy.error('getVideoSources');
    }

    // get media2 information

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
      await onvif.media.media2.getProfiles();
    } catch (e) {
      loggy.error('getProfiles');
    }

    try {
      await onvif.media.media2.getServiceCapabilities();
    } catch (e) {
      loggy.error('getServiceCapabilities');
    }

    // get ptz information

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

    // await onvif.ptz.getCompatibleConfigurations(profileToken);

    // await onvif.ptz.getConfigurationOptions(configurationToken);

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
