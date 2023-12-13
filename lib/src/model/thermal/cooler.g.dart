// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cooler _$CoolerFromJson(Map<String, dynamic> json) => Cooler(
      enabled: json['Enabled'] as bool,
      runTime: (json['RunTime'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoolerToJson(Cooler instance) => <String, dynamic>{
      'Enabled': instance.enabled,
      'RunTime': instance.runTime,
    };
