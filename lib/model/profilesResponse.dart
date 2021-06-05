import 'package:json_annotation/json_annotation.dart';

import 'profile.dart';

part 'profilesResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProfilesResponse {
  @JsonKey(name: 'Profiles')
  final List<Profile> profiles;

  GetProfilesResponse(this.profiles);

  factory GetProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfilesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfilesResponseToJson(this);
}
