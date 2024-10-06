import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'real_time_streaming_capabilities.dart';

part 'media_capabilities.g.dart';

/// MediaCapabilities capabilities
@JsonSerializable()
class MediaCapabilities {
  /// MediaCapabilities service URI.
  @JsonKey(name: 'XAddr', fromJson: OnvifUtil.mappedToString)
  final String xAddr;

  /// Streaming capabilities.
  @JsonKey(name: 'StreamingCapabilities')
  final RealTimeStreamingCapabilities streamingCapabilities;

  MediaCapabilities({
    required this.xAddr,
    required this.streamingCapabilities,
  });

  factory MediaCapabilities.fromJson(Map<String, dynamic> json) =>
      _$MediaCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$MediaCapabilitiesToJson(this);
}
