import 'package:json_annotation/json_annotation.dart';

import 'analytics.dart';
import 'device.dart';
import 'media.dart';
import 'events.dart';
import 'ptz.dart';

part 'capabilities.g.dart';

@JsonSerializable(explicitToJson: true)
class Capabilities {
  @JsonKey(name: 'Analytics')
  final Analytics analytics;

  @JsonKey(name: 'Device')
  final Device device;

  @JsonKey(name: 'Media')
  final Media media;

  @JsonKey(name: 'Events')
  final Events events;

  @JsonKey(name: 'PTZ')
  final Ptz ptz;

  Capabilities(this.analytics, this.device, this.media, this.events, this.ptz);

  factory Capabilities.fromJson(Map<String, dynamic> json) =>
      _$CapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CapabilitiesToJson(this);
}
