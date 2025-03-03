import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'event.dart';
import 'ptz_filter.dart';
import 'multicast_configuration.dart';

part 'metadata_configuration.g.dart';

///representation of a profile that exist in the media service
@JsonSerializable()
class MetadataConfiguration {
  static final _xmlMappedFields = <String>[
    'Name',
    'UseCount',
    'Analytics',
    'Multicast',
    'SessionTimeout',
    'AnalyticsEngineConfiguration',
  ];

  /// Token that uniquely references this configuration. Length up to 64
  /// characters.
  @JsonKey(name: '@token')
  final String token;

  /// User readable name. Length up to 64 characters.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.stringMappedFromXml)
  final String name;

  /// Number of internal references currently using this configuration.
  /// This informational parameter is read-only. Deprecated for Media2 Service.
  @JsonKey(name: 'UseCount', fromJson: OnvifUtil.intMappedFromXml)
  final int? useCount;

  /// Optional parameter to configure compression type of Metadata payload. Use
  /// values from enumeration MetadataCompressionType.
  @JsonKey(name: 'CompressionType')
  final String? compressionType;

  /// Optional parameter to configure if the metadata stream shall contain the
  /// Geo Location coordinates of each target.
  @JsonKey(name: 'GeoLocation')
  final bool? geoLocation;

  /// Optional parameter to configure if the generated metadata stream should
  /// contain shape information as polygon.
  @JsonKey(name: 'ShapePolygon')
  final bool? shapePolygon;

  /// optional element to configure which PTZ related data is to include in the
  /// metadata stream
  @JsonKey(name: 'PTZStatus')
  final PtzFilter? ptzStatus;

  /// Optional element to configure the streaming of events. A client might be
  /// interested in receiving all, none or some of the events produced by the
  /// device:
  /// - To get all events: Include the Events element but do not include a
  /// filter.
  /// - To get no events: Do not include the Events element.
  /// - To get only some events: Include the Events element and include a filter
  /// in the element.
  @JsonKey(name: 'Events')
  final List<Event>? events;

  /// Defines whether the streamed metadata will include metadata from the
  /// analytics engines (video, cell motion, audio etc.)
  @JsonKey(name: 'Analytics', fromJson: OnvifUtil.nullableBoolMappedFromXml)
  final bool? analytics;

  /// Defines the multicast settings that could be used for video streaming.
  @JsonKey(name: 'Multicast', fromJson: OnvifUtil.emptyOrMulticastConfiguration)
  final MulticastConfiguration? multicast;

  /// The rtsp session timeout for the related audio stream (when using Media2
  /// Service, this value is deprecated and ignored)
  @JsonKey(name: 'SessionTimeout', fromJson: OnvifUtil.stringMappedFromXml)
  final String? sessionTimeout;

  /// Indication which AnalyticsModules shall output metadata. Note that the
  /// streaming behavior is undefined if the list includes items that are not
  /// part of the associated AnalyticsConfiguration.
  @JsonKey(name: 'AnalyticsEngineConfiguration')
  final Map<String, dynamic>? analyticsEngineConfiguration;

  @JsonKey(name: 'Extension')
  final Map<String, dynamic>? extension;

  MetadataConfiguration({
    required this.token,
    required this.name,
    this.useCount,
    this.compressionType,
    this.geoLocation,
    this.shapePolygon,
    this.ptzStatus,
    this.events,
    this.analytics,
    this.multicast,
    this.sessionTimeout,
    this.analyticsEngineConfiguration,
    this.extension,
  });

  factory MetadataConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MetadataConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataConfigurationToJson(
    this,
  ).convertFieldsToXmlMap(_xmlMappedFields);

  @override
  String toString() => json.encode(toJson());
}
