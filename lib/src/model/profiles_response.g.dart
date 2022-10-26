// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfilesResponse _$GetProfilesResponseFromJson(Map<String, dynamic> json) =>
    GetProfilesResponse(
      (json['Profiles'] as List<dynamic>)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProfilesResponseToJson(
        GetProfilesResponse instance) =>
    <String, dynamic>{
      'Profiles': instance.profiles.map((e) => e.toJson()).toList(),
    };
