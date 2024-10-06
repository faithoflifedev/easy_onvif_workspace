// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileCapabilities _$ProfileCapabilitiesFromJson(Map<String, dynamic> json) =>
    ProfileCapabilities(
      maximumNumberOfProfiles:
          int.parse(json['@MaximumNumberOfProfiles'] as String),
      configurationsSupported: OnvifUtil.nullableStringToList(
          json['ConfigurationsSupported'] as String?),
    );

Map<String, dynamic> _$ProfileCapabilitiesToJson(
        ProfileCapabilities instance) =>
    <String, dynamic>{
      '@MaximumNumberOfProfiles': instance.maximumNumberOfProfiles,
      'ConfigurationsSupported': instance.configurationsSupported,
    };
