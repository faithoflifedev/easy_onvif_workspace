import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

import 'backlight_compensation.dart';
import 'exposure.dart';
import 'focus.dart';
import 'wide_dynamic_range.dart';
import 'white_balance.dart';

part 'imaging.g.dart';

///Optional configuration of the image sensor.
@JsonSerializable(explicitToJson: true)
class Imaging {
  ///Enabled/disabled BLC mode (on/off).
  @JsonKey(name: 'BacklightCompensation')
  final BacklightCompensation? backlightCompensation;

  ///Image brightness (unit unspecified).
  @JsonKey(name: 'Brightness', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? brightness;

  ///Color saturation of the image (unit unspecified).
  @JsonKey(name: 'ColorSaturation', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? colorSaturation;

  ///Contrast of the image (unit unspecified).
  @JsonKey(name: 'Contrast', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? contrast;

  ///Exposure mode of the device.
  @JsonKey(name: 'Exposure')
  final Exposure? exposure;

  ///Exposure mode of the device.
  @JsonKey(name: 'Focus')
  final Focus? focus;

  ///Infrared Cutoff Filter settings.
  ///- enum { 'ON', 'OFF', 'AUTO' }
  @JsonKey(name: 'IrCutFilter', fromJson: OnvifUtil.nullableMappedToString)
  final String? irCutFilter;

  ///Sharpness of the Video image.
  @JsonKey(name: 'Sharpness', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? sharpness;

  ///Sharpness of the Video image.
  @JsonKey(name: 'WideDynamicRange')
  final WideDynamicRange? wideDynamicRange;

  ///Sharpness of the Video image.
  @JsonKey(name: 'WhiteBalance')
  final WhiteBalance? whiteBalance;

  Imaging(
      {this.backlightCompensation,
      this.brightness,
      this.colorSaturation,
      this.contrast,
      this.exposure,
      this.focus,
      this.irCutFilter,
      this.sharpness,
      this.wideDynamicRange,
      this.whiteBalance});

  factory Imaging.fromJson(Map<String, dynamic> json) =>
      _$ImagingFromJson(json);

  Map<String, dynamic> toJson() => _$ImagingToJson(this);

  @override
  String toString() => json.encode(toJson());
}
