// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Body _$BodyFromJson(Map<String, dynamic> json) => Body(
      fault: json['Fault'],
      dateTimeResponse: json['GetSystemDateAndTimeResponse'] == null
          ? null
          : GetSystemDateAndTimeResponse.fromJson(
              json['GetSystemDateAndTimeResponse'] as Map<String, dynamic>),
      capabilitiesResponse: json['GetCapabilitiesResponse'] == null
          ? null
          : GetCapabilitiesResponse.fromJson(
              json['GetCapabilitiesResponse'] as Map<String, dynamic>),
      serviceCapabilitiesResponse: json['GetServiceCapabilitiesResponse'] ==
              null
          ? null
          : GetServiceCapabilitiesResponse.fromJson(
              json['GetServiceCapabilitiesResponse'] as Map<String, dynamic>),
      configurationResponse: json['GetConfigurationResponse'] == null
          ? null
          : GetConfigurationResponse.fromJson(
              json['GetConfigurationResponse'] as Map<String, dynamic>),
      configurationsResponse: json['GetConfigurationsResponse'] == null
          ? null
          : GetConfigurationsResponse.fromJson(
              json['GetConfigurationsResponse'] as Map<String, dynamic>),
      deviceInformationResponse: json['GetDeviceInformationResponse'] == null
          ? null
          : GetDeviceInformationResponse.fromJson(
              json['GetDeviceInformationResponse'] as Map<String, dynamic>),
      audioSourcesResponse: json['GetAudioSourcesResponse'] == null
          ? null
          : GetAudioSourcesResponse.fromJson(
              json['GetAudioSourcesResponse'] as Map<String, dynamic>),
      videoSourcesResponse: json['GetVideoSourcesResponse'] == null
          ? null
          : GetVideoSourcesResponse.fromJson(
              json['GetVideoSourcesResponse'] as Map<String, dynamic>),
      profilesResponse: json['GetProfilesResponse'] == null
          ? null
          : GetProfilesResponse.fromJson(
              json['GetProfilesResponse'] as Map<String, dynamic>),
      servicesResponse: json['GetServicesResponse'] == null
          ? null
          : GetServicesResponse.fromJson(
              json['GetServicesResponse'] as Map<String, dynamic>),
      getPresetResponse: json['GetPresetsResponse'] == null
          ? null
          : GetPresetResponse.fromJson(
              json['GetPresetsResponse'] as Map<String, dynamic>),
      setPresetResponse: json['SetPresetResponse'] == null
          ? null
          : SetPresetResponse.fromJson(
              json['SetPresetResponse'] as Map<String, dynamic>),
      snapshotUriResponse: json['GetSnapshotUriResponse'] == null
          ? null
          : GetUriResponse.fromJson(
              json['GetSnapshotUriResponse'] as Map<String, dynamic>),
      streamUriResponse: json['GetStreamUriResponse'] == null
          ? null
          : GetUriResponse.fromJson(
              json['GetStreamUriResponse'] as Map<String, dynamic>),
      networkProtocolsResponse: json['GetNetworkProtocolsResponse'] == null
          ? null
          : GetNetworkProtocolsResponse.fromJson(
              json['GetNetworkProtocolsResponse'] as Map<String, dynamic>),
      statusResponse: json['GetStatusResponse'] == null
          ? null
          : GetStatusResponse.fromJson(
              json['GetStatusResponse'] as Map<String, dynamic>),
      hostnameResponse: json['GetHostnameResponse'] == null
          ? null
          : GetHostnameResponse.fromJson(
              json['GetHostnameResponse'] as Map<String, dynamic>),
      ntpResponse: json['GetNTPResponse'] == null
          ? null
          : GetNTPResponse.fromJson(
              json['GetNTPResponse'] as Map<String, dynamic>),
      systemUrisResponse: json['GetSystemUrisResponse'] == null
          ? null
          : GetSystemUrisResponse.fromJson(
              json['GetSystemUrisResponse'] as Map<String, dynamic>),
      usersResponse: json['GetUsersResponse'] == null
          ? null
          : GetUsersResponse.fromJson(
              json['GetUsersResponse'] as Map<String, dynamic>),
      probeMatches: json['ProbeMatches'] == null
          ? null
          : ProbeMatches.fromJson(json['ProbeMatches'] as Map<String, dynamic>),
      metadataConfigurationsResponse:
          json['GetMetadataConfigurationsResponse'] == null
              ? null
              : GetMetadataConfigurationsResponse.fromJson(
                  json['GetMetadataConfigurationsResponse']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$BodyToJson(Body instance) => <String, dynamic>{
      'GetSystemDateAndTimeResponse': instance.dateTimeResponse?.toJson(),
      'GetCapabilitiesResponse': instance.capabilitiesResponse?.toJson(),
      'GetConfigurationResponse': instance.configurationResponse?.toJson(),
      'GetConfigurationsResponse': instance.configurationsResponse?.toJson(),
      'GetDeviceInformationResponse':
          instance.deviceInformationResponse?.toJson(),
      'GetAudioSourcesResponse': instance.audioSourcesResponse?.toJson(),
      'GetVideoSourcesResponse': instance.videoSourcesResponse?.toJson(),
      'GetProfilesResponse': instance.profilesResponse?.toJson(),
      'GetServicesResponse': instance.servicesResponse?.toJson(),
      'GetServiceCapabilitiesResponse':
          instance.serviceCapabilitiesResponse?.toJson(),
      'GetPresetsResponse': instance.getPresetResponse?.toJson(),
      'SetPresetResponse': instance.setPresetResponse?.toJson(),
      'GetSnapshotUriResponse': instance.snapshotUriResponse?.toJson(),
      'GetStreamUriResponse': instance.streamUriResponse?.toJson(),
      'GetNetworkProtocolsResponse':
          instance.networkProtocolsResponse?.toJson(),
      'GetStatusResponse': instance.statusResponse?.toJson(),
      'GetHostnameResponse': instance.hostnameResponse?.toJson(),
      'GetNTPResponse': instance.ntpResponse?.toJson(),
      'ProbeMatches': instance.probeMatches?.toJson(),
      'GetSystemUrisResponse': instance.systemUrisResponse?.toJson(),
      'GetUsersResponse': instance.usersResponse?.toJson(),
      'GetMetadataConfigurationsResponse':
          instance.metadataConfigurationsResponse?.toJson(),
      'Fault': instance.fault,
    };
