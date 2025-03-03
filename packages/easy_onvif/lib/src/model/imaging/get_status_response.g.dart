// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStatusResponse _$GetStatusResponseFromJson(Map<String, dynamic> json) =>
    GetStatusResponse(
      imagingStatus20: ImagingStatus20.fromJson(
        json['Status'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$GetStatusResponseToJson(GetStatusResponse instance) =>
    <String, dynamic>{'Status': instance.imagingStatus20};
