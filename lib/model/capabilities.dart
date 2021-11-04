import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'analytics.dart';
import 'device.dart';
import 'media.dart';
import 'events.dart';
import 'ptz.dart';

part 'capabilities.g.dart';

@JsonSerializable(explicitToJson: true)

///Capability information.
class Capabilities {
  ///Analytics capabilities
  @JsonKey(name: 'Analytics')
  final Analytics? analytics;

  ///Device capabilities
  @JsonKey(name: 'Device')
  final Device? device;

  ///Media capabilities
  @JsonKey(name: 'Media')
  final Media? media;

  ///Event capabilities
  @JsonKey(name: 'Events')
  final Events? events;

  ///PTZ capabilities
  @JsonKey(name: 'PTZ')
  final Ptz? ptz;

  Capabilities(
      {this.analytics, this.device, this.media, this.events, this.ptz});

  factory Capabilities.fromJson(Map<String, dynamic> json) =>
      _$CapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
