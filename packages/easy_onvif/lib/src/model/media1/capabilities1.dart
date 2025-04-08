import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'profile_capabilities.dart';
import 'streaming_capabilities.dart';

part 'capabilities1.g.dart';

/// The capabilities for the media service is returned in the Capabilities element.
@JsonSerializable()
class Capabilities1 {
  /// Indicates if GetSnapshotUri is supported.
  @JsonKey(name: '@SnapshotUri', fromJson: OnvifUtil.nullableStringToBool)
  final bool? snapshotUri;

  /// Indicates whether or not Rotation feature is supported.
  @JsonKey(name: '@Rotation', fromJson: OnvifUtil.nullableStringToBool)
  final bool? rotation;

  /// Indicates the support for changing video source mode.
  @JsonKey(name: '@VideoSourceMode', fromJson: OnvifUtil.nullableStringToBool)
  final bool? videoSourceMode;

  /// Indicates if OSD is supported.
  @JsonKey(name: '@OSD', fromJson: OnvifUtil.nullableStringToBool)
  final bool? osd;

  /// Indicates the support for temporary osd text configuration.
  @JsonKey(name: '@TemporaryOSDText', fromJson: OnvifUtil.nullableStringToBool)
  final bool? temporaryOSDText;

  /// Indicates the support for the Efficient XML Interchange (EXI) binary XML format.
  @JsonKey(name: '@EXICompression', fromJson: OnvifUtil.nullableStringToBool)
  final bool? exiCompression;

  /// Media profile capabilities.
  @JsonKey(name: 'ProfileCapabilities')
  final ProfileCapabilities profileCapabilities;

  /// Streaming capabilities.
  @JsonKey(name: 'StreamingCapabilities')
  final StreamingCapabilities streamingCapabilities;

  Capabilities1({
    this.snapshotUri,
    this.rotation,
    this.videoSourceMode,
    this.osd,
    this.temporaryOSDText,
    this.exiCompression,
    required this.profileCapabilities,
    required this.streamingCapabilities,
  });

  factory Capabilities1.fromJson(Map<String, dynamic> json) =>
      _$Capabilities1FromJson(json);

  Map<String, dynamic> toJson() => _$Capabilities1ToJson(this);

  @override
  String toString() => json.encode(toJson());
}
