// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_configuration_options_extension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetadataConfigurationOptionsExtension
_$MetadataConfigurationOptionsExtensionFromJson(Map<String, dynamic> json) =>
    MetadataConfigurationOptionsExtension(
      compressionType: MetadataConfigurationOptionsExtension._parseUnbound(
        json['CompressionType'],
      ),
      extension: json['Extension'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MetadataConfigurationOptionsExtensionToJson(
  MetadataConfigurationOptionsExtension instance,
) => <String, dynamic>{
  'CompressionType': instance.compressionType,
  'Extension': instance.extension,
};
