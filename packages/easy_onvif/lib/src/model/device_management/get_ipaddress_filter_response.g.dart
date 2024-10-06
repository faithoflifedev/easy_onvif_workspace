// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ipaddress_filter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIpAddressFilterResponse _$GetIpAddressFilterResponseFromJson(
        Map<String, dynamic> json) =>
    GetIpAddressFilterResponse(
      ipAddressFilter: IpAddressFilter.fromJson(
          json['IPAddressFilter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetIpAddressFilterResponseToJson(
        GetIpAddressFilterResponse instance) =>
    <String, dynamic>{
      'IPAddressFilter': instance.ipAddressFilter,
    };
