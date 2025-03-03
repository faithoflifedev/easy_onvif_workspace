// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h264.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

H264 _$H264FromJson(Map<String, dynamic> json) => H264(
  govLength: OnvifUtil.intMappedFromXml(
    json['GovLength'] as Map<String, dynamic>,
  ),
  h264Profile: H264.mappedToAudioCodecEncoding(
    json['H264Profile'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$H264ToJson(H264 instance) => <String, dynamic>{
  'GovLength': instance.govLength,
  'H264Profile': _$H264ProfileEnumMap[instance.h264Profile]!,
};

const _$H264ProfileEnumMap = {
  H264Profile.baseline: 'baseline',
  H264Profile.main: 'main',
  H264Profile.extended: 'extended',
  H264Profile.high: 'high',
};
