import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'profile_capabilities.dart';
import 'streaming_capabilities.dart';

part 'capabilities2.g.dart';

/// The capabilities for the media service is returned in the Capabilities
/// element.
@JsonSerializable()
class Capabilities2 {
  /// Indicates if GetSnapshotUri is supported.
  @JsonKey(name: '@SnapshotUri', fromJson: OnvifUtil.stringToBool)
  final bool snapshotUri;

  /// Indicates whether or not Rotation feature is supported.
  @JsonKey(name: '@Rotation', fromJson: OnvifUtil.stringToBool)
  final bool rotation;

  /// Indicates the support for changing video source mode.
  @JsonKey(name: '@VideoSourceMode', fromJson: OnvifUtil.stringToBool)
  final bool videoSourceMode;

  /// Indicates if OSD is supported.
  @JsonKey(name: '@OSD', fromJson: OnvifUtil.stringToBool)
  final bool osd;

  /// Indicates the support for temporary osd text configuration.
  @JsonKey(name: '@TemporaryOSDText', fromJson: OnvifUtil.nullableStringToBool)
  final bool? temporaryOSDText;

  /// Indicates the support for temporary osd text configuration.
  @JsonKey(name: '@EXICompression', fromJson: OnvifUtil.nullableStringToBool)
  final bool? exiCompression;

  /// Indicates if Masking is supported.
  @JsonKey(name: '@Mask', fromJson: OnvifUtil.nullableStringToBool)
  final bool? mask;

  /// Indicates that privacy masks are only supported at the video source level
  /// and not the video source configuration level. If this is true any
  /// addition, deletion or change of a privacy mask done for one video source
  /// configuration will automatically be applied by the device to a
  /// corresponding privacy mask for all other video source configuration
  /// associated with the same video source.
  @JsonKey(name: 'SourceMask', fromJson: OnvifUtil.nullableStringToBool)
  final bool? sourceMask;

  /// Media profile capabilities.
  @JsonKey(name: 'ProfileCapabilities')
  final ProfileCapabilities profileCapabilities;

  /// Streaming capabilities.
  @JsonKey(name: 'StreamingCapabilities')
  final StreamingCapabilities streamingCapabilities;

  Capabilities2({
    required this.profileCapabilities,
    required this.streamingCapabilities,
    required this.snapshotUri,
    required this.rotation,
    required this.videoSourceMode,
    required this.osd,
    required this.temporaryOSDText,
    required this.exiCompression,
    this.mask,
    this.sourceMask,
  });

  factory Capabilities2.fromJson(Map<String, dynamic> json) =>
      _$Capabilities2FromJson(json);

  Map<String, dynamic> toJson() => _$Capabilities2ToJson(this);

  @override
  String toString() => json.encode(toJson());
}
