import 'package:easy_onvif/onvif.dart';
import 'package:universal_io/io.dart';
import 'package:yaml/yaml.dart';

void main(List<String> arguments) async {
  //get connection infomration from the config.yaml file
  final config = loadYaml(File('example/config.yaml').readAsStringSync());

  // configure device connection
  final onvif = await Onvif.connect(
      host: config['host'],
      username: config['username'],
      password: config['password']);

  // final onvif = await Onvif.connect(
  //     host: 'thoainguyentek.gvdip.com:24',
  //     username: 'admin',
  //     password: 'admin123456');

  //get service capabilities
  var deviceServiceCapabilities =
      await onvif.deviceManagement.getServiceCapabilities();

  print(
      'max password length: ${deviceServiceCapabilities.security.maxPasswordLength}');

  //get service addresses
  var serviceList = await onvif.deviceManagement.getServices();

  for (Service service in serviceList) {
    print('${service.nameSpace} ${service.xAddr}');
  }

  //get device info
  var deviceInfo = await onvif.deviceManagement.getDeviceInformation();

  print('Model: ${deviceInfo.model}');

  var ptzConfigs = await onvif.ptz.getConfigurations();

  for (var ptzConfiguration in ptzConfigs) {
    print('${ptzConfiguration.name} ${ptzConfiguration.token}');
  }

  print('xMax: ${ptzConfigs[0].panTiltLimits!.range.xRange.max}');
  print('xMin: ${ptzConfigs[0].panTiltLimits!.range.xRange.min}');
  print('yMax: ${ptzConfigs[0].panTiltLimits!.range.yRange.max}');
  print('yMin: ${ptzConfigs[0].panTiltLimits!.range.yRange.min}');

  // get device profiles
  var profs = await onvif.media.getProfiles();

  for (var profile in profs) {
    print('name: ${profile.name}, token: ${profile.token}');
  }

  final uri = await onvif.media.getStreamUri(profs[0].token);

  final rtsp = OnvifUtil.authenticatingUri(
      uri.uri, config['username'], config['password']);

  print('stream uri: $rtsp');

  var ntpInformation = await onvif.deviceManagement.getNtp();

  print(ntpInformation);

  var configurations = await onvif.media.getMetadataConfigurations();

  for (var configuration in configurations) {
    print('${configuration.name} ${configuration.token}');
  }
}
