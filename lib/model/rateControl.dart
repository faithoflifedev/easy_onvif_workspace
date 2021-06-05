import 'package:json_annotation/json_annotation.dart';

part 'rateControl.g.dart';

@JsonSerializable()
class RateControl {
  @JsonKey(name: 'FrameRateLimit')
  final dynamic xmlFrameRateLimit;

  @JsonKey(name: 'EncodingInterval')
  final dynamic xmlEncodingInterval;

  @JsonKey(name: 'BitrateLimit')
  final dynamic xmlBitrateLimit;

  int get frameRateLimit => int.parse(xmlFrameRateLimit['\$']);

  int get encodingInterval => int.parse(xmlEncodingInterval['\$']);

  int get bitrateLimit => int.parse(xmlBitrateLimit['\$']);

  RateControl(
      this.xmlFrameRateLimit, this.xmlEncodingInterval, this.xmlBitrateLimit);

  factory RateControl.fromJson(Map<String, dynamic> json) =>
      _$RateControlFromJson(json);

  Map<String, dynamic> toJson() => _$RateControlToJson(this);
}
