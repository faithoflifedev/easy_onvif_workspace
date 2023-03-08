import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'transport.dart';

part 'stream_setup.g.dart';

/// Stream Setup that should be used with the uri
@JsonSerializable()
class StreamSetup {
  /// Defines if a multicast or unicast stream is requested
  /// - enum { 'RTP-Unicast', 'RTP-Multicast' }
  @JsonKey(name: 'Stream')
  final String stream;

  /// Optional element to describe further tunnel options. This element is
  /// normally not needed
  @JsonKey(name: 'Transport')
  final Transport transport;

  StreamSetup({
    required this.stream,
    required this.transport,
  });

  factory StreamSetup.fromJson(Map<String, dynamic> json) =>
      _$StreamSetupFromJson(json);

  Map<String, dynamic> toJson() => _$StreamSetupToJson(this);

  @override
  String toString() => json.encode(toJson());
}
