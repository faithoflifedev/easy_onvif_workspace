import 'package:easy_onvif/onvif.dart';
import 'package:universal_io/io.dart';
import 'package:yaml/yaml.dart';

void main(List<String> arguments) async {
  //get connection infomration from the config.yaml file
  final config = loadYaml(File('example/cli/config.yaml').readAsStringSync());

  //configure device connection
  var onvif = Onvif(
      host: config['host'],
      username: config['username'],
      password: config['password']);

  //initiate connection
  await onvif.initialize();

  //get device info
  var deviceInfo = await onvif.deviceManagement.getDeviceInformation();

  print('Model: ${deviceInfo.model}');

  var ptzConfigs = await onvif.ptz.getConfigurations();

  ptzConfigs.forEach((element) {
    print(element.name + ' ' + element.token);
  });

  print('xMax: ${ptzConfigs[0].panTiltLimits!.range.xRange.max}');
  print('xMin: ${ptzConfigs[0].panTiltLimits!.range.xRange.min}');
  print('yMax: ${ptzConfigs[0].panTiltLimits!.range.yRange.max}');
  print('yMin: ${ptzConfigs[0].panTiltLimits!.range.yRange.min}');

  //get device profiles
  var profs = await onvif.media.getProfiles();

  profs.forEach((element) {
    print(element.name + ' ' + element.token);
  });

  final uri = await onvif.media.getStreamUri(profs[2].token);

  final rtsp = OnvifUtil.authenticatingUri(
      uri.uri, config['username'], config['password']);

  print('stream uri: $rtsp');

  var profileToken = profs[0].token;

  var preset_list = await onvif.ptz.getPresets(profileToken);

  // await onvif.ptz.zoomIn(profileToken);

  await onvif.ptz
      .gotoPreset(profileToken, preset_list[0]); //8 taraweeh //0 announcement

  //change camera view through ptz
  await onvif.ptz.absoluteMove(
      profileToken,
      PtzPosition(
          panTilt: PanTilt.fromDouble(x: 0.01, y: 0.01),
          zoom: Zoom.fromDouble(0.1)));

  //change camera view in steps
  for (var i = 0; i < 10; i++) {
    await onvif.ptz
        .relativeMove(profileToken, PtzPosition(zoom: Zoom.fromDouble(-0.005)));

    await Future.delayed(Duration(seconds: 1));
  }

  //get configured presets
  var presets = await onvif.ptz.getPresets(profileToken);

  //get snapshout uri
  var snapshotUri = await onvif.media.getSnapshotUri(profileToken);

  print(snapshotUri.uri);

  var mediaUri = await onvif.media.getSnapshotUri(profileToken);

  print(mediaUri.uri);

  var streamUri = await onvif.media.getStreamUri(profileToken);

  print('streamuri: ' + streamUri.uri);

  //convert preset to Hashmap
  final Map<String, Preset> presetMap = {
    for (var preset in presets.sublist(0, 15)) preset.name: preset
  };

  print(presetMap);

  var preset = presets[11];

  print(
      'preset: ${preset.position.panTilt?.x}  ${preset.position.panTilt?.y}  ${preset.position.zoom?.x}');

  //chahnge camera view to a given preset
  await onvif.ptz.gotoPreset(profileToken, preset);

  // await Future.delayed(Duration(seconds: 1));

  // var current = await onvif.ptz.getStatus(profileToken);

  // var status = await onvif.ptz.getStatus(profileToken);

  // var moving = current.position != status.position;

  // print('moving: ${moving}');

  // print(
  //     'after: ${current.position.panTilt?.x}  ${current.position.panTilt?.y}  ${current.position.zoom?.x}');

  //list audio sources
  await audioSource(onvif);

  //perform a set of ptx operations
  await checkMoveAndZoom(onvif, profileToken);
}

Future<void> audioSource(Onvif onvif) async {
  final audioSources = await onvif.media.getAudioSources();

  audioSources.forEach(
      (element) => print(element.channels.toString() + ' ' + element.token));
}

Future<void> checkMoveAndZoom(Onvif onvif, String profileToken) async {
  await onvif.ptz.moveUp(profileToken);

  await Future.delayed(Duration(seconds: 2));

  await onvif.ptz.moveDown(profileToken);

  await Future.delayed(Duration(seconds: 2));

  await onvif.ptz.moveRight(profileToken);

  await Future.delayed(Duration(seconds: 2));

  await onvif.ptz.moveLeft(profileToken);

  await Future.delayed(Duration(seconds: 2));

  await onvif.ptz.zoomIn(profileToken);

  await Future.delayed(Duration(seconds: 2));

  await onvif.ptz.zoomOut(profileToken);
}
