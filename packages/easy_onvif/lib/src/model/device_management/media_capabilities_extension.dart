import 'package:json_annotation/json_annotation.dart';

part 'media_capabilities_extension.g.dart';

@JsonSerializable()
class MediaCapabilitiesExtension {
  /// Maximum number of profiles.
  @JsonKey(name: 'MediaCapabilitiesExtension')
  final MediaCapabilitiesExtension mediaCapabilitiesExtension;

  MediaCapabilitiesExtension({required this.mediaCapabilitiesExtension});

  factory MediaCapabilitiesExtension.fromJson(Map<String, dynamic> json) =>
      _$MediaCapabilitiesExtensionFromJson(json);

  Map<String, dynamic> toJson() => _$MediaCapabilitiesExtensionToJson(this);
}
