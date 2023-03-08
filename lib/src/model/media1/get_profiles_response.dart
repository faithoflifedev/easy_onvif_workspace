import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'profile.dart';

part 'get_profiles_response.g.dart';

/// Any endpoint can ask for the existing media profiles of a device using the
/// [Media.getProfiles] command. Pre-configured or dynamically configured
/// profiles can be retrieved using this command. This command lists all
/// configured profiles in a device. The client does not need to know the media
/// profile in order to use the command.
@JsonSerializable()
class GetProfilesResponse {
  /// lists all profiles that exist in the media service
  @JsonKey(name: 'Profiles', fromJson: _unbound)
  final List<Profile> profiles;

  GetProfilesResponse(this.profiles);

  factory GetProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfilesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfilesResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<Profile> _unbound(dynamic json) {
    if (json == null) {
      return <Profile>[];
    }

    if (json is List) {
      return json
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [Profile.fromJson(json as Map<String, dynamic>)];
  }
}
