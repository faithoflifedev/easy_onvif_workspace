// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Body _$BodyFromJson(Map<String, dynamic> json) => Body(
      fault: json['Fault'],
      absoluteMoveResponse: json['AbsoluteMoveResponse'],
      audioSourcesResponse: json['GetAudioSourcesResponse'] == null
          ? null
          : GetAudioSourcesResponse.fromJson(
              json['GetAudioSourcesResponse'] as Map<String, dynamic>),
      capabilitiesResponse: json['GetCapabilitiesResponse'] == null
          ? null
          : GetCapabilitiesResponse.fromJson(
              json['GetCapabilitiesResponse'] as Map<String, dynamic>),
      compatibleConfigurationsResponse:
          json['GetCompatibleConfigurationsResponse'] == null
              ? null
              : GetCompatibleConfigurationsResponse.fromJson(
                  json['GetCompatibleConfigurationsResponse']
                      as Map<String, dynamic>),
      configurationResponse: json['GetConfigurationResponse'] == null
          ? null
          : GetConfigurationResponse.fromJson(
              json['GetConfigurationResponse'] as Map<String, dynamic>),
      configurationsResponse: json['GetConfigurationsResponse'] == null
          ? null
          : GetConfigurationsResponse.fromJson(
              json['GetConfigurationsResponse'] as Map<String, dynamic>),
      continuousMoveResponse: json['ContinuousMoveResponse'],
      dateTimeResponse: json['GetSystemDateAndTimeResponse'] == null
          ? null
          : GetSystemDateAndTimeResponse.fromJson(
              json['GetSystemDateAndTimeResponse'] as Map<String, dynamic>),
      deviceInformationResponse: json['GetDeviceInformationResponse'] == null
          ? null
          : GetDeviceInformationResponse.fromJson(
              json['GetDeviceInformationResponse'] as Map<String, dynamic>),
      getPresetResponse: json['GetPresetsResponse'] == null
          ? null
          : GetPresetResponse.fromJson(
              json['GetPresetsResponse'] as Map<String, dynamic>),
      hostnameResponse: json['GetHostnameResponse'] == null
          ? null
          : GetHostnameResponse.fromJson(
              json['GetHostnameResponse'] as Map<String, dynamic>),
      metadataConfigurationsResponse:
          json['GetMetadataConfigurationsResponse'] == null
              ? null
              : GetMetadataConfigurationsResponse.fromJson(
                  json['GetMetadataConfigurationsResponse']
                      as Map<String, dynamic>),
      networkProtocolsResponse: json['GetNetworkProtocolsResponse'] == null
          ? null
          : GetNetworkProtocolsResponse.fromJson(
              json['GetNetworkProtocolsResponse'] as Map<String, dynamic>),
      ntpResponse: json['GetNTPResponse'] == null
          ? null
          : GetNTPResponse.fromJson(
              json['GetNTPResponse'] as Map<String, dynamic>),
      probeMatches: json['ProbeMatches'] == null
          ? null
          : ProbeMatches.fromJson(json['ProbeMatches'] as Map<String, dynamic>),
      profilesResponse: json['GetProfilesResponse'] == null
          ? null
          : GetProfilesResponse.fromJson(
              json['GetProfilesResponse'] as Map<String, dynamic>),
      serviceCapabilitiesResponse: json['GetServiceCapabilitiesResponse'] ==
              null
          ? null
          : GetServiceCapabilitiesResponse.fromJson(
              json['GetServiceCapabilitiesResponse'] as Map<String, dynamic>),
      servicesResponse: json['GetServicesResponse'] == null
          ? null
          : GetServicesResponse.fromJson(
              json['GetServicesResponse'] as Map<String, dynamic>),
      setPresetResponse: json['SetPresetResponse'] == null
          ? null
          : SetPresetResponse.fromJson(
              json['SetPresetResponse'] as Map<String, dynamic>),
      snapshotUriResponse: json['GetSnapshotUriResponse'] == null
          ? null
          : GetUriResponse.fromJson(
              json['GetSnapshotUriResponse'] as Map<String, dynamic>),
      statusResponse: json['GetStatusResponse'] == null
          ? null
          : GetStatusResponse.fromJson(
              json['GetStatusResponse'] as Map<String, dynamic>),
      stopResponse: json['StopResponse'],
      streamUriResponse: json['GetStreamUriResponse'] == null
          ? null
          : GetUriResponse.fromJson(
              json['GetStreamUriResponse'] as Map<String, dynamic>),
      systemUrisResponse: json['GetSystemUrisResponse'] == null
          ? null
          : GetSystemUrisResponse.fromJson(
              json['GetSystemUrisResponse'] as Map<String, dynamic>),
      usersResponse: json['GetUsersResponse'] == null
          ? null
          : GetUsersResponse.fromJson(
              json['GetUsersResponse'] as Map<String, dynamic>),
      videoSourcesResponse: json['GetVideoSourcesResponse'] == null
          ? null
          : GetVideoSourcesResponse.fromJson(
              json['GetVideoSourcesResponse'] as Map<String, dynamic>),
      gotoPresetResponse: json['GotoPresetResponse'],
    );

Map<String, dynamic> _$BodyToJson(Body instance) => <String, dynamic>{
      'AbsoluteMoveResponse': instance.absoluteMoveResponse,
      'ContinuousMoveResponse': instance.continuousMoveResponse,
      'StopResponse': instance.stopResponse,
      'GotoPresetResponse': instance.gotoPresetResponse,
      'GetSystemDateAndTimeResponse': instance.dateTimeResponse,
      'GetCapabilitiesResponse': instance.capabilitiesResponse,
      'GetConfigurationResponse': instance.configurationResponse,
      'GetConfigurationsResponse': instance.configurationsResponse,
      'GetDeviceInformationResponse': instance.deviceInformationResponse,
      'GetAudioSourcesResponse': instance.audioSourcesResponse,
      'GetVideoSourcesResponse': instance.videoSourcesResponse,
      'GetProfilesResponse': instance.profilesResponse,
      'GetServicesResponse': instance.servicesResponse,
      'GetServiceCapabilitiesResponse': instance.serviceCapabilitiesResponse,
      'GetPresetsResponse': instance.getPresetResponse,
      'SetPresetResponse': instance.setPresetResponse,
      'GetSnapshotUriResponse': instance.snapshotUriResponse,
      'GetStreamUriResponse': instance.streamUriResponse,
      'GetNetworkProtocolsResponse': instance.networkProtocolsResponse,
      'GetStatusResponse': instance.statusResponse,
      'GetHostnameResponse': instance.hostnameResponse,
      'GetNTPResponse': instance.ntpResponse,
      'ProbeMatches': instance.probeMatches,
      'GetSystemUrisResponse': instance.systemUrisResponse,
      'GetUsersResponse': instance.usersResponse,
      'GetMetadataConfigurationsResponse':
          instance.metadataConfigurationsResponse,
      'GetCompatibleConfigurationsResponse':
          instance.compatibleConfigurationsResponse,
      'Fault': instance.fault,
    };
