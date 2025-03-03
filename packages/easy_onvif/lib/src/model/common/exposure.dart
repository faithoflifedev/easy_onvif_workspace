import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'window.dart';

part 'exposure.g.dart';

/// List of existing Video Sources
@JsonSerializable()
class Exposure {
  static final _xmlMappedFields = <String>[
    'Mode',
    'Priority',
    'Window',
    'MinExposureTime',
    'MaxExposureTime',
    'MinGain',
    'MaxGain',
    'MinIris',
    'MaxIris',
    'Gain',
    'Iris',
  ];

  /// Exposure Mode
  /// - Auto - Enabled the exposure algorithm on the NVT.
  /// - Manual - Disabled exposure algorithm on the NVT.
  /// - enum { 'AUTO', 'MANUAL' }
  @JsonKey(name: 'Mode', fromJson: OnvifUtil.nullableStringMappedFromXml)
  final String? mode;

  /// The exposure priority mode (low noise/framerate).
  /// - enum { 'LowNoise', 'FrameRate' }
  @JsonKey(name: 'Priority', fromJson: OnvifUtil.nullableStringMappedFromXml)
  final String? priority;

  ///Rectangular exposure mask.
  @JsonKey(name: 'Window')
  final Window window;

  ///Minimum value of exposure time range allowed to be used by the algorithm.
  @JsonKey(
    name: 'MinExposureTime',
    fromJson: OnvifUtil.nullableDoubleMappedFromXml,
  )
  final double? minExposureTime;

  ///Maximum value of exposure time range allowed to be used by the algorithm.
  @JsonKey(
    name: 'MaxExposureTime',
    fromJson: OnvifUtil.nullableDoubleMappedFromXml,
  )
  final double? maxExposureTime;

  ///Minimum value of the sensor gain range that is allowed to be used by the
  ///algorithm.
  @JsonKey(name: 'MinGain', fromJson: OnvifUtil.nullableDoubleMappedFromXml)
  final double? minGain;

  ///Maximum value of the sensor gain range that is allowed to be used by the
  ///algorithm.
  @JsonKey(name: 'MaxGain', fromJson: OnvifUtil.nullableDoubleMappedFromXml)
  final double? maxGain;

  ///Minimum value of the iris range allowed to be used by the algorithm.
  @JsonKey(name: 'MinIris', fromJson: OnvifUtil.nullableDoubleMappedFromXml)
  final double? minIris;

  ///Maximum value of the iris range allowed to be used by the algorithm.
  @JsonKey(name: 'MaxIris', fromJson: OnvifUtil.nullableDoubleMappedFromXml)
  final double? maxIris;

  ///The fixed exposure time used by the image sensor (μs).
  @JsonKey(
    name: 'ExposureTime',
    fromJson: OnvifUtil.nullableDoubleMappedFromXml,
  )
  final double? exposureTime;

  ///The fixed gain used by the image sensor (dB).
  @JsonKey(name: 'Gain', fromJson: OnvifUtil.nullableDoubleMappedFromXml)
  final double? gain;

  ///The fixed attenuation of input light affected by the iris (dB). 0dB maps to
  ///a fully opened iris.
  @JsonKey(name: 'Iris', fromJson: OnvifUtil.nullableDoubleMappedFromXml)
  final double? iris;

  Exposure({
    this.mode,
    this.priority,
    required this.window,
    this.minExposureTime,
    this.maxExposureTime,
    this.minGain,
    this.maxGain,
    this.minIris,
    this.maxIris,
    this.exposureTime,
    this.gain,
    this.iris,
  });

  factory Exposure.fromJson(Map<String, dynamic> json) =>
      _$ExposureFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ExposureToJson(this).convertFieldsToXmlMap(_xmlMappedFields);

  @override
  String toString() => json.encode(toJson());
}
