// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ptz_status_filter_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PtzStatusFilterOptions _$PtzStatusFilterOptionsFromJson(
  Map<String, dynamic> json,
) => PtzStatusFilterOptions(
  panTiltStatusSupported: OnvifUtil.boolMappedFromXml(
    json['PanTiltStatusSupported'] as Map<String, dynamic>,
  ),
  zoomStatusSupported: OnvifUtil.boolMappedFromXml(
    json['ZoomStatusSupported'] as Map<String, dynamic>,
  ),
  panTiltPositionSupported: OnvifUtil.nullableBoolMappedFromXml(
    json['PanTiltPositionSupported'] as Map<String, dynamic>?,
  ),
  zoomPositionSupported: OnvifUtil.nullableBoolMappedFromXml(
    json['ZoomPositionSupported'] as Map<String, dynamic>?,
  ),
  extension: json['Extension'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$PtzStatusFilterOptionsToJson(
  PtzStatusFilterOptions instance,
) => <String, dynamic>{
  'PanTiltStatusSupported': instance.panTiltStatusSupported,
  'ZoomStatusSupported': instance.zoomStatusSupported,
  'PanTiltPositionSupported': instance.panTiltPositionSupported,
  'ZoomPositionSupported': instance.zoomPositionSupported,
  'Extension': instance.extension,
};
