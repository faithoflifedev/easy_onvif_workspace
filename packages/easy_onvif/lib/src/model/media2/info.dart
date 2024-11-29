import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'codec.dart';

part 'info.g.dart';

/// The minimum guaranteed total number of encoder instances (applications) per
/// VideoSourceConfiguration.
@JsonSerializable()
class Info {
  /// If a device limits the number of instances for respective Video Codecs the
  /// response contains the information how many streams can be set up at the
  /// same time per VideoSource.
  @JsonKey(name: 'Codec', fromJson: _fromJson)
  final List<Codec>? codec;

  /// The minimum guaranteed total number of encoder instances (applications)
  /// per VideoSourceConfiguration. The device is able to deliver the Total
  /// number of streams
  @JsonKey(name: 'Total', fromJson: OnvifUtil.intMappedFromXml)
  final int total;

  Info({
    this.codec,
    required this.total,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<Codec> _fromJson(dynamic json) => OnvifUtil.jsonList<Codec>(
      json, (json) => Codec.fromJson(json as Map<String, dynamic>));
}
