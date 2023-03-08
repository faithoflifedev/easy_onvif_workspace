// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileCapabilities _$ProfileCapabilitiesFromJson(Map<String, dynamic> json) =>
    ProfileCapabilities(
      maximumNumberOfProfiles: OnvifUtil.mappedToInt(
          json['MaximumNumberOfProfiles'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileCapabilitiesToJson(
        ProfileCapabilities instance) =>
    <String, dynamic>{
      'MaximumNumberOfProfiles': instance.maximumNumberOfProfiles,
    };
