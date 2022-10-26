import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

import 'window.dart';

part 'exposure.g.dart';

///List of existing Video Sources
@JsonSerializable(explicitToJson: true)
class Exposure {
  ///Exposure Mode
  ///- Auto - Enabled the exposure algorithm on the NVT.
  ///- Manual - Disabled exposure algorithm on the NVT.
  ///- enum { 'AUTO', 'MANUAL' }

  @JsonKey(name: 'Mode', fromJson: OnvifUtil.mappedToString)
  final String mode;

  ///The exposure priority mode (low noise/framerate).
  ///- enum { 'LowNoise', 'FrameRate' }
  @JsonKey(name: 'Priority', fromJson: OnvifUtil.mappedToString)
  final String priority;

  ///Rectangular exposure mask.
  @JsonKey(name: 'Window')
  final Window window;

  ///Minimum value of exposure time range allowed to be used by the algorithm.
  @JsonKey(name: 'MinExposureTime', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? minExposureTime;

  ///Maximum value of exposure time range allowed to be used by the algorithm.
  @JsonKey(name: 'MaxExposureTime', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? maxExposureTime;

  ///Minimum value of the sensor gain range that is allowed to be used by the
  ///algorithm.
  @JsonKey(name: 'MinGain', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? minGain;

  ///Maximum value of the sensor gain range that is allowed to be used by the
  ///algorithm.
  @JsonKey(name: 'MaxGain', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? maxGain;

  ///Minimum value of the iris range allowed to be used by the algorithm.
  @JsonKey(name: 'MinIris', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? minIris;

  ///Maximum value of the iris range allowed to be used by the algorithm.
  @JsonKey(name: 'MaxIris', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? maxIris;

  ///The fixed exposure time used by the image sensor (μs).
  @JsonKey(name: 'ExposureTime', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? exposureTime;

  ///The fixed gain used by the image sensor (dB).
  @JsonKey(name: 'Gain', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? gain;

  ///The fixed attenuation of input light affected by the iris (dB). 0dB maps to
  ///a fully opened iris.
  @JsonKey(name: 'Iris', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? iris;

  Exposure(
      {required this.mode,
      required this.priority,
      required this.window,
      required this.minExposureTime,
      required this.maxExposureTime,
      required this.minGain,
      required this.maxGain,
      required this.minIris,
      required this.maxIris,
      required this.exposureTime,
      required this.gain,
      required this.iris});

  factory Exposure.fromJson(Map<String, dynamic> json) =>
      _$ExposureFromJson(json);

  Map<String, dynamic> toJson() => _$ExposureToJson(this);

  @override
  String toString() => json.encode(toJson());
}
