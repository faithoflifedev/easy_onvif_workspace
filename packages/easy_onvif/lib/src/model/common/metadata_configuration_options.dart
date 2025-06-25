import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'metadata_configuration_options_extension.dart';
import 'ptz_status_filter_options.dart';

part 'metadata_configuration_options.g.dart';

/// This message contains the metadata configuration options. If a metadata
/// configuration is specified, the options shall concern that particular
/// configuration. If a media profile is specified, the options shall be
/// compatible with that media profile. If no tokens are specified, the options
/// shall be considered generic for the device.
@JsonSerializable()
class MetadataConfigurationOptions {
  /// True if the device is able to stream the Geo Located positions of each
  /// target.
  @JsonKey(name: '@GeoLocation', fromJson: OnvifUtil.nullableStringToBool)
  final bool? geoLocation;

  /// A device signalling support for content filtering shall support
  /// expressions with the provided expression size.
  @JsonKey(name: '@MaxContentFilterSize', fromJson: OnvifUtil.optionalInt)
  final int? maxContentFilterSize;

  @JsonKey(name: 'PTZStatusFilterOptions')
  final PtzStatusFilterOptions? ptzStatusFilterOptions;

  @JsonKey(name: 'Extension')
  final MetadataConfigurationOptionsExtension? extension;

  MetadataConfigurationOptions({
    this.geoLocation,
    this.maxContentFilterSize,
    this.ptzStatusFilterOptions,
    this.extension,
  });

  factory MetadataConfigurationOptions.fromJson(Map<String, dynamic> json) =>
      _$MetadataConfigurationOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataConfigurationOptionsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
