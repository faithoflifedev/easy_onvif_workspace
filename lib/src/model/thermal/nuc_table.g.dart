// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nuc_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NucTable _$NucTableFromJson(Map<String, dynamic> json) => NucTable(
      token: json['Token'] as String,
      lowTemperature: (json['LowTemperature'] as num).toDouble(),
      highTemperature: (json['HighTemperature'] as num).toDouble(),
      name: json['Name'] as String,
    );

Map<String, dynamic> _$NucTableToJson(NucTable instance) => <String, dynamic>{
      'Token': instance.token,
      'LowTemperature': instance.lowTemperature,
      'HighTemperature': instance.highTemperature,
      'Name': instance.name,
    };
