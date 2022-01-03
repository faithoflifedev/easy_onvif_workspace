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

  // get device profiles
  var profs = await onvif.media.getProfiles();

  profs.forEach((element) {
    print(element.name + ' ' + element.token);
  });

  final uri = await onvif.media.getStreamUri(profs[2].token);

  final rtsp = OnvifUtil.authenticatingUri(
      uri.uri, config['username'], config['password']);

  print('stream uri: $rtsp');
}
