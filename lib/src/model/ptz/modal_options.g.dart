// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modal_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModalOptions _$ModalOptionsFromJson(Map<String, dynamic> json) => ModalOptions(
      mode: OnvifUtil.nullableMappedToStringList(json['Mode'] as List?),
    );

Map<String, dynamic> _$ModalOptionsToJson(ModalOptions instance) =>
    <String, dynamic>{
      'Mode': instance.mode,
    };
