import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'codec.g.dart';

/// If a device limits the number of instances for respective Video Codecs the
/// response contains the information how many streams can be set up at the same
/// time per VideoSource.
@JsonSerializable()
class Codec {
  /// Video Media Subtype for the video format. For definitions see
  /// tt:VideoEncodingMimeNames and [IANA Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml#video).
  @JsonKey(name: 'Encoding', fromJson: OnvifUtil.stringMappedFromXml)
  final String encoding;

  /// The minimum guaranteed number of encoder instances (applications) for the
  /// VideoSourceConfiguration.
  @JsonKey(name: 'Number', fromJson: OnvifUtil.intMappedFromXml)
  final int number;

  Codec({required this.encoding, required this.number});

  factory Codec.fromJson(Map<String, dynamic> json) => _$CodecFromJson(json);

  Map<String, dynamic> toJson() => _$CodecToJson(this);

  @override
  String toString() => json.encode(toJson());
}
