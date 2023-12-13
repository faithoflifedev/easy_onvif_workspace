import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'nuc_table.g.dart';

/// Current Non-Uniformity Correction (NUC) Table in use by the Thermal Device.
@JsonSerializable()
class NucTable {
  /// Unique identifier of this NUC Table.
  @JsonKey(name: 'Token')
  final String token;

  /// Low Temperature limit for application of NUC Table, in Kelvin.
  @JsonKey(name: 'LowTemperature')
  final double lowTemperature;

  /// High Temperature limit for application of NUC Table, in Kelvin.
  @JsonKey(name: 'HighTemperature')
  final double highTemperature;

  /// User readable name for the Non-Uniformity Correction (NUC) Table.
  @JsonKey(name: 'Name')
  final String name;

  NucTable({
    required this.token,
    required this.lowTemperature,
    required this.highTemperature,
    required this.name,
  });

  factory NucTable.fromJson(Map<String, dynamic> json) =>
      _$NucTableFromJson(json);

  Map<String, dynamic> toJson() => _$NucTableToJson(this);

  @override
  String toString() => json.encode(toJson());
}
