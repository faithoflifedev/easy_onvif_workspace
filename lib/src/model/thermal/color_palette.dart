import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'color_palette.g.dart';

/// Current Color Palette in use by the Thermal Device.
@JsonSerializable()
class ColorPalette {
  /// Unique identifier of this Color Palette.
  @JsonKey(name: 'token')
  final String token;

  /// Indicates Color Palette Type. Use tth:ColorPaletteType. Used for multi-language support and display.
  @JsonKey(name: 'Type')
  final String type;

  /// User readable Color Palette name.
  @JsonKey(name: 'Name')
  String? name;

  ColorPalette({
    required this.token,
    required this.type,
    required this.name,
  });

  factory ColorPalette.fromJson(Map<String, dynamic> json) =>
      _$ColorPaletteFromJson(json);

  Map<String, dynamic> toJson() => _$ColorPaletteToJson(this);

  @override
  String toString() => json.encode(toJson());
}
