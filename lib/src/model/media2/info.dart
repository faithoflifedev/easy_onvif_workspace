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
  @JsonKey(name: 'Codec', fromJson: _unbound)
  final List<Codec>? codec;

  /// The minimum guaranteed total number of encoder instances (applications)
  /// per VideoSourceConfiguration. The device is able to deliver the Total
  /// number of streams
  @JsonKey(name: 'Total', fromJson: OnvifUtil.mappedToInt)
  final int total;

  Info({
    this.codec,
    required this.total,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

  static List<Codec>? _unbound(dynamic json) {
    if (json is List) {
      return json
          .map((e) => Codec.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [Codec.fromJson(json as Map<String, dynamic>)];
  }

  @override
  String toString() => json.encode(toJson());
}
