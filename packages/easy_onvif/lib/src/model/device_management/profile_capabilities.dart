import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_capabilities.g.dart';

/// Profile capabilities
@JsonSerializable()
class ProfileCapabilities {
  /// Maximum number of profiles.
  @JsonKey(
    name: 'MaximumNumberOfProfiles',
    fromJson: OnvifUtil.intMappedFromXml,
  )
  final int maximumNumberOfProfiles;

  ProfileCapabilities({required this.maximumNumberOfProfiles});

  factory ProfileCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ProfileCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCapabilitiesToJson(this);
}
