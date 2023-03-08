import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'profile.dart';

part 'get_profile_response.g.dart';

/// The GetMetadataConfiguration command fetches the metadata configuration if
/// the metadata token is known.
@JsonSerializable()
class GetProfileResponse {
  /// The requested metadata configuration.
  @JsonKey(name: 'Profile')
  final Profile profile;

  GetProfileResponse({required this.profile});

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfileResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
