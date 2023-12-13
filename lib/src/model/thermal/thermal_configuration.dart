import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'color_palette.dart';
import 'cooler.dart';
import 'nuc_table.dart';

part 'thermal_configuration.g.dart';

/// Polarity configuration of the Thermal Device.
/// - enum { 'WhiteHot', 'BlackHot' }
enum Polarity {
  @JsonValue('WhiteHot')
  whiteHot,
  @JsonValue('BlackHot')
  blackHot,
}

/// Configuration of the thermal.
@JsonSerializable()
class ThermalConfiguration {
  /// Current Color Palette in use by the Thermal Device.
  @JsonKey(name: 'ColorPalette')
  final ColorPalette colorPalette;

  /// Polarity configuration of the Thermal Device.
  @JsonKey(name: 'Polarity')
  final Polarity polarity;

  /// Current Non-Uniformity Correction (NUC) Table in use by the Thermal Device.
  @JsonKey(name: 'NUCTable')
  final NucTable? nucTable;

  @JsonKey(name: 'Cooler')
  final Cooler? cooler;

  ThermalConfiguration({
    required this.colorPalette,
    required this.polarity,
    this.nucTable,
    this.cooler,
  });

  factory ThermalConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ThermalConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ThermalConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
