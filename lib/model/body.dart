import 'package:json_annotation/json_annotation.dart';

import 'audioSourcesResponse.dart';
import 'capabilitiesResponse.dart';
import 'deviceInformationResponse.dart';
import 'fault.dart';
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

@JsonSerializable(explicitToJson: true)
class Body {
  @JsonKey(name: 'GetSystemDateAndTimeResponse')
  final GetSystemDateAndTimeResponse? dateTimeResponse;

  @JsonKey(name: 'GetCapabilitiesResponse')
  final GetCapabilitiesResponse? capabilitiesResponse;

  @JsonKey(name: 'GetDeviceInformationResponse')
  final GetDeviceInformationResponse? deviceInformationResponse;

  @JsonKey(name: 'GetAudioSourcesResponse')
  final GetAudioSourcesResponse? audioSourcesResponse;

  @JsonKey(name: 'GetVideoSourcesResponse')
  final GetVideoSourcesResponse? videoSourcesResponse;

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
  final Fault? fault;

  Body(
      {this.fault,
      this.dateTimeResponse,
      this.capabilitiesResponse,
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
