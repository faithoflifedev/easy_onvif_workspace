import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'imaging.g.dart';

/// Optional configuration of the image sensor.
@JsonSerializable()
class Imaging {
  static final _xmlMappedFields = <String>[
    'BacklightCompensation',
    'Brightness',
    'ColorSaturation',
    'Contrast',
    'IrCutFilter',
    'Sharpness',
  ];

  /// Enabled/disabled BLC mode (on/off).
  @JsonKey(name: 'BacklightCompensation')
  final BacklightCompensation? backlightCompensation;

  /// Image brightness (unit unspecified).
  @JsonKey(
    name: 'Brightness',
    fromJson: OnvifUtil.nullableDoubleMappedFromXml,
  )
  final double? brightness;

  /// Color saturation of the image (unit unspecified).
  @JsonKey(
    name: 'ColorSaturation',
    fromJson: OnvifUtil.nullableDoubleMappedFromXml,
  )
  final double? colorSaturation;

  /// Contrast of the image (unit unspecified).
  @JsonKey(
    name: 'Contrast',
    fromJson: OnvifUtil.nullableDoubleMappedFromXml,
  )
  final double? contrast;

  /// Exposure mode of the device.
  @JsonKey(name: 'Exposure')
  final Exposure? exposure;

  /// Exposure mode of the device.
  @JsonKey(name: 'Focus')
  final Focus? focus;

  /// Infrared Cutoff Filter settings.
  /// - enum { 'ON', 'OFF', 'AUTO' }
  @JsonKey(
    name: 'IrCutFilter',
    fromJson: OnvifUtil.nullableStringMappedFromXml,
  )
  final String? irCutFilter;

  /// Sharpness of the Video image.
  @JsonKey(
    name: 'Sharpness',
    fromJson: OnvifUtil.nullableDoubleMappedFromXml,
  )
  final double? sharpness;

  /// Wide Dynamic Range settings.
  @JsonKey(name: 'WideDynamicRange')
  final WideDynamicRange? wideDynamicRange;

  /// White balance settings.
  @JsonKey(name: 'WhiteBalance')
  final WhiteBalance? whiteBalance;

  Imaging({
    this.backlightCompensation,
    this.brightness,
    this.colorSaturation,
    this.contrast,
    this.exposure,
    this.focus,
    this.irCutFilter,
    this.sharpness,
    this.wideDynamicRange,
    this.whiteBalance,
  });

  factory Imaging.fromJson(Map<String, dynamic> json) =>
      _$ImagingFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ImagingToJson(this).convertFieldsToXmlMap(_xmlMappedFields);

  @override
  String toString() => json.encode(toJson());
}
