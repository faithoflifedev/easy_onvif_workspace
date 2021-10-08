// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'networkProtocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkProtocol _$NetworkProtocolFromJson(Map<String, dynamic> json) =>
    NetworkProtocol(
      json['Name'],
      json['Enabled'],
      json['Port'],
    );

Map<String, dynamic> _$NetworkProtocolToJson(NetworkProtocol instance) =>
    <String, dynamic>{
      'Name': instance.xmlName,
      'Enabled': instance.xmlEnabled,
      'Port': instance.xmlPort,
    };
