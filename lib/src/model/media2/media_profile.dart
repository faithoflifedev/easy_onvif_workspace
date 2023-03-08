import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'configuration_set.dart';

part 'media_profile.g.dart';

/// Lists all profiles that exist in the media service. The response provides
/// the requested types of Configurations as far as available. If a profile
/// doesn't contain a type no error shall be provided.
@JsonSerializable()
class MediaProfile {
  /// Unique identifier of the profile.
  @JsonKey(name: '@token')
  final String token;

  /// A value of true signals that the profile cannot be deleted. Default is
  /// false.
  @JsonKey(name: '@fixed', fromJson: OnvifUtil.nullableStringToBool)
  final bool? fixed;

  /// User readable name of the profile.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  @JsonKey(name: 'Configurations')
  final ConfigurationSet? configurations;

  MediaProfile({
    required this.token,
    required this.fixed,
    required this.name,
    this.configurations,
  });

  factory MediaProfile.fromJson(Map<String, dynamic> json) =>
      _$MediaProfileFromJson(json);

  Map<String, dynamic> toJson() => _$MediaProfileToJson(this);

  @override
  String toString() => json.encode(toJson());
}
