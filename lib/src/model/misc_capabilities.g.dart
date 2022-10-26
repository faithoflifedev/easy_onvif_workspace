// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiscCapabilities _$MiscCapabilitiesFromJson(Map<String, dynamic> json) =>
    MiscCapabilities(
      auxiliaryCommands: MiscCapabilities._auxiliaryCommandsConverter(
          json['@AuxiliaryCommands']),
    );

Map<String, dynamic> _$MiscCapabilitiesToJson(MiscCapabilities instance) =>
    <String, dynamic>{
      '@AuxiliaryCommands': instance.auxiliaryCommands,
    };
