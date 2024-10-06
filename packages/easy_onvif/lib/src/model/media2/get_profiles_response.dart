import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'media_profile.dart';

part 'get_profiles_response.g.dart';

/// Any endpoint can ask for the existing media profiles of a device using the
/// [Media.getProfiles] command. Pre-configured or dynamically configured
/// profiles can be retrieved using this command. This command lists all
/// configured profiles in a device. The client does not need to know the media
/// profile in order to use the command.
@JsonSerializable()
class GetProfilesResponse {
  /// lists all profiles that exist in the media service
  @JsonKey(name: 'Profiles', fromJson: _fromJson)
  final List<MediaProfile> profiles;

  GetProfilesResponse({required this.profiles});

  factory GetProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfilesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfilesResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<MediaProfile> _fromJson(dynamic json) =>
      OnvifUtil.jsonList<MediaProfile>(
          json, (json) => MediaProfile.fromJson(json as Map<String, dynamic>));
}
