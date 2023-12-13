import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'cooler.g.dart';

/// Cooler settings of the Thermal Device.
@JsonSerializable()
class Cooler {
  /// Indicates whether the Cooler is enabled (running) or not.
  @JsonKey(name: 'Enabled')
  final bool enabled;

  /// Number of hours the Cooler has been running (unit: hours). Read-only.
  @JsonKey(name: 'RunTime')
  final double? runTime;

  Cooler({
    required this.enabled,
    this.runTime,
  });

  factory Cooler.fromJson(Map<String, dynamic> json) => _$CoolerFromJson(json);

  Map<String, dynamic> toJson() => _$CoolerToJson(this);

  @override
  String toString() => json.encode(toJson());
}
