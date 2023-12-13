// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thermal_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThermalConfiguration _$ThermalConfigurationFromJson(
        Map<String, dynamic> json) =>
    ThermalConfiguration(
      colorPalette:
          ColorPalette.fromJson(json['ColorPalette'] as Map<String, dynamic>),
      polarity: $enumDecode(_$PolarityEnumMap, json['Polarity']),
      nucTable: json['NUCTable'] == null
          ? null
          : NucTable.fromJson(json['NUCTable'] as Map<String, dynamic>),
      cooler: json['Cooler'] == null
          ? null
          : Cooler.fromJson(json['Cooler'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThermalConfigurationToJson(
        ThermalConfiguration instance) =>
    <String, dynamic>{
      'ColorPalette': instance.colorPalette,
      'Polarity': _$PolarityEnumMap[instance.polarity]!,
      'NUCTable': instance.nucTable,
      'Cooler': instance.cooler,
    };

const _$PolarityEnumMap = {
  Polarity.whiteHot: 'WhiteHot',
  Polarity.blackHot: 'BlackHot',
};
