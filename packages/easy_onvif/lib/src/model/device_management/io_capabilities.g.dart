// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'io_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IoCapabilities _$IoCapabilitiesFromJson(Map<String, dynamic> json) =>
    IoCapabilities(
      inputConnectors: OnvifUtil.nullableMappedToInt(
          json['InputConnectors'] as Map<String, dynamic>?),
      relayOutputs: OnvifUtil.nullableMappedToInt(
          json['RelayOutputs'] as Map<String, dynamic>?),
      extension: json['Extension'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$IoCapabilitiesToJson(IoCapabilities instance) =>
    <String, dynamic>{
      'InputConnectors': instance.inputConnectors,
      'RelayOutputs': instance.relayOutputs,
      'Extension': instance.extension,
    };
