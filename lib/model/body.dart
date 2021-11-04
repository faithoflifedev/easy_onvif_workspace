import 'package:json_annotation/json_annotation.dart';

import 'audioSourcesResponse.dart';
import 'capabilitiesResponse.dart';
import 'configurationResponse.dart';
import 'configurationsResponse.dart';
import 'deviceInformationResponse.dart';
// import 'fault.dart';
import 'hostnameResponse.dart';
import 'networkProtocolsResponse.dart';
import 'ntpResponse.dart';
import 'getPresetResponse.dart';
import 'profilesResponse.dart';
import 'servicesResponse.dart';
import 'setPresetResponse.dart';
import 'statusResponse.dart';
import 'systemDateTimeResponse.dart';
import 'systemUrisResponse.dart';
import 'usersResponse.dart';
import 'videoSourcesResponse.dart';
import 'uriResponse.dart';
import 'probe/probeMatches.dart';

part 'body.g.dart';

///represents the body of the XML SOAP response.
@JsonSerializable(explicitToJson: true)
class Body {
  ///This operation gets the device system date and time. The device shall
  ///support the return of the daylight saving setting and of the manual system
  ///date and time (if applicable) or indication of NTP time (if applicable)
  ///through the [DeviceManagement.getSystemDateAndTime] command.
  ///A device shall provide the UTCDateTime information.
  @JsonKey(name: 'GetSystemDateAndTimeResponse')
  final GetSystemDateAndTimeResponse? dateTimeResponse;

  ///This operation has been replaced by the more generic GetServices method.
  ///For capabilities of individual services refer to the
  ///[Media.getServiceCapabilities] methods.
  @JsonKey(name: 'GetCapabilitiesResponse')
  final GetCapabilitiesResponse? capabilitiesResponse;

  ///Get a specific PTZconfiguration from the device, identified by its reference
  ///token or name.
  ///
  ///The default Position/Translation/Velocity Spaces are introduced to allow NVCs
  ///sending move requests without the need to specify a certain coordinate
  ///system. The default Speeds are introduced to control the speed of move
  ///requests (absolute, relative, preset), where no explicit speed has been set.
  ///
  ///The allowed pan and tilt range for Pan/Tilt Limits is defined by a
  ///two-dimensional space range that is mapped to a specific Absolute Pan/Tilt
  ///Position Space. At least one Pan/Tilt Position Space is required by the
  ///PTZNode to support Pan/Tilt limits. The limits apply to all supported
  ///absolute, relative and continuous Pan/Tilt movements. The limits shall be
  ///checked within the coordinate system for which the limits have been
  ///specified. That means that even if movements are specified in a different
  ///coordinate system, the requested movements shall be transformed to the
  ///coordinate system of the limits where the limits can be checked. When a
  ///relative or continuous movements is specified, which would leave the
  ///specified limits, the PTZ unit has to move along the specified limits. The
  ///Zoom Limits have to be interpreted accordingly.
  @JsonKey(name: 'GetConfigurationResponse')
  final GetConfigurationResponse? configurationResponse;

  ///Get a specific PTZconfiguration from the device, identified by its reference
  ///token or name.
  ///
  ///The default Position/Translation/Velocity Spaces are introduced to allow NVCs
  ///sending move requests without the need to specify a certain coordinate
  ///system. The default Speeds are introduced to control the speed of move
  ///requests (absolute, relative, preset), where no explicit speed has been set.
  ///
  ///The allowed pan and tilt range for Pan/Tilt Limits is defined by a
  ///two-dimensional space range that is mapped to a specific Absolute Pan/Tilt
  ///Position Space. At least one Pan/Tilt Position Space is required by the
  ///PTZNode to support Pan/Tilt limits. The limits apply to all supported
  ///absolute, relative and continuous Pan/Tilt movements. The limits shall be
  ///checked within the coordinate system for which the limits have been
  ///specified. That means that even if movements are specified in a different
  ///coordinate system, the requested movements shall be transformed to the
  ///coordinate system of the limits where the limits can be checked. When a
  ///relative or continuous movements is specified, which would leave the
  ///specified limits, the PTZ unit has to move along the specified limits.
  @JsonKey(name: 'GetConfigurationsResponse')
  final GetConfigurationsResponse? configurationsResponse;

  ///This operation gets basic device information from the device.
  @JsonKey(name: 'GetDeviceInformationResponse')
  final GetDeviceInformationResponse? deviceInformationResponse;

  ///This operation lists all available physical audio inputs of the device.
  @JsonKey(name: 'GetAudioSourcesResponse')
  final GetAudioSourcesResponse? audioSourcesResponse;

  ///This operation lists all available physical video inputs of the device.
  @JsonKey(name: 'GetVideoSourcesResponse')
  final GetVideoSourcesResponse? videoSourcesResponse;

  ///Any endpoint can ask for the existing media profiles of a device using the
  ///[Media.getProfiles] command. Pre-configured or dynamically configured profiles
  ///can be retrieved using this command. This command lists all configured
  ///profiles in a device. The client does not need to know the media profile in
  ///order to use the command.
  @JsonKey(name: 'GetProfilesResponse')
  final GetProfilesResponse? profilesResponse;

  @JsonKey(name: 'GetServicesResponse')
  final GetServicesResponse? servicesResponse;

  @JsonKey(name: 'GetPresetsResponse')
  final GetPresetResponse? getPresetResponse;

  @JsonKey(name: 'SetPresetsResponse')
  final SetPresetResponse? setPresetResponse;

  @JsonKey(name: 'GetSnapshotUriResponse')
  final GetUriResponse? snapshotUriResponse;

  @JsonKey(name: 'GetStreamUriResponse')
  final GetUriResponse? streamUriResponse;

  @JsonKey(name: 'GetNetworkProtocolsResponse')
  final GetNetworkProtocolsResponse? networkProtocolsResponse;

  @JsonKey(name: 'GetStatusResponse')
  final GetStatusResponse? statusResponse;

  @JsonKey(name: 'GetHostnameResponse')
  final GetHostnameResponse? hostnameResponse;

  @JsonKey(name: 'GetNTPResponse')
  final GetNTPResponse? ntpResponse;

  @JsonKey(name: 'ProbeMatches')
  final ProbeMatches? probeMatches;

  @JsonKey(name: 'GetSystemUrisResponse')
  final GetSystemUrisResponse? systemUrisResponse;

  @JsonKey(name: 'GetUsersResponse')
  final GetUsersResponse? usersResponse;

  @JsonKey(name: 'Fault')
  final dynamic fault;

  Body(
      {this.fault,
      this.dateTimeResponse,
      this.capabilitiesResponse,
      this.configurationResponse,
      this.configurationsResponse,
      this.deviceInformationResponse,
      this.audioSourcesResponse,
      this.videoSourcesResponse,
      this.profilesResponse,
      this.servicesResponse,
      this.getPresetResponse,
      this.setPresetResponse,
      this.snapshotUriResponse,
      this.streamUriResponse,
      this.networkProtocolsResponse,
      this.statusResponse,
      this.hostnameResponse,
      this.ntpResponse,
      this.systemUrisResponse,
      this.usersResponse,
      this.probeMatches});

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);

  Map<String, dynamic> toJson() => _$BodyToJson(this);

  bool get hasFault => fault != null;
}
