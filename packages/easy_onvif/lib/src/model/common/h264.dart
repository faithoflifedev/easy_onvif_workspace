import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'h264.g.dart';

@JsonSerializable()

/// Optional element to configure H.264 related parameters.
class H264 {
  static final _xmlMappedFields = <String>[
    'GovLength',
    'H264Profile',
  ];

  /// Group of Video frames length. Determines typically the interval in which
  /// the I-Frames will be coded. An entry of 1 indicates I-Frames are
  /// continuously generated. An entry of 2 indicates that every 2nd image is an
  /// I-Frame, and 3 only every 3rd frame, etc. The frames in between are coded
  /// as P or B Frames.
  @JsonKey(
    name: 'GovLength',
    fromJson: OnvifUtil.intMappedFromXml,
  )
  final int govLength;

  /// the H.264 profile, either baseline, main, extended or high
  /// - enum { 'Baseline', 'Main', 'Extended', 'High' }
  @JsonKey(
    name: 'H264Profile',
    fromJson: mappedToAudioCodecEncoding,
  )
  final H264Profile h264Profile;

  H264({
    required this.govLength,
    required this.h264Profile,
  });

  factory H264.fromJson(Map<String, dynamic> json) => _$H264FromJson(json);

  Map<String, dynamic> toJson() =>
      _$H264ToJson(this).convertFieldsToXmlMap(_xmlMappedFields);

  static H264Profile mappedToAudioCodecEncoding(Map<String, dynamic> value) =>
      H264Profile.values
          .byName(OnvifUtil.stringMappedFromXml(value).toLowerCase());

  @override
  String toString() => json.encode(toJson());
}

@JsonEnum()
enum H264Profile {
  baseline('Baseline'),
  main('Main'),
  extended('Extended'),
  high('High');

  const H264Profile(this.value);

  final String value;
}
