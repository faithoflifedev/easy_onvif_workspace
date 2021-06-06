import 'package:json_annotation/json_annotation.dart';

part 'rateControl.g.dart';

@JsonSerializable()

///Optional element to configure rate control related parameters.
class RateControl {
  @JsonKey(name: 'FrameRateLimit')
  final dynamic xmlFrameRateLimit;

  @JsonKey(name: 'EncodingInterval')
  final dynamic xmlEncodingInterval;

  @JsonKey(name: 'BitrateLimit')
  final dynamic xmlBitrateLimit;

  ///Maximum output framerate in fps. If an EncodingInterval is provided the
  ///resulting encoded framerate will be reduced by the given factor.
  int get frameRateLimit => int.parse(xmlFrameRateLimit['\$']);

  ///Interval at which images are encoded and transmitted. (A value of 1 means
  ///that every frame is encoded, a value of 2 means that every 2nd frame is
  ///encoded ...)
  int get encodingInterval => int.parse(xmlEncodingInterval['\$']);

  ///the maximum output bitrate in kbps
  int get bitrateLimit => int.parse(xmlBitrateLimit['\$']);

  RateControl(
      this.xmlFrameRateLimit, this.xmlEncodingInterval, this.xmlBitrateLimit);

  factory RateControl.fromJson(Map<String, dynamic> json) =>
      _$RateControlFromJson(json);

  Map<String, dynamic> toJson() => _$RateControlToJson(this);
}
