import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

import 'endpoint_reference.dart';

part 'probe_match.g.dart';

@JsonSerializable(explicitToJson: true)
class ProbeMatch {
  @JsonKey(name: 'EndpointReference')
  final EndpointReference endpointReference;

  @JsonKey(name: 'Types', fromJson: _typeList)
  final List<String> types;

  @JsonKey(name: 'Scopes', fromJson: _scopeMap)
  final Map<String, String> scopes;

  @JsonKey(name: 'XAddrs', fromJson: OnvifUtil.mappedToString)
  final String xaddrs;

  @JsonKey(name: 'MetadataVersion', fromJson: OnvifUtil.mappedToString)
  final String metadataVersion;

  ProbeMatch(
      {required this.endpointReference,
      required this.types,
      required this.scopes,
      required this.xaddrs,
      required this.metadataVersion});

  factory ProbeMatch.fromJson(Map<String, dynamic> json) =>
      _$ProbeMatchFromJson(json);

  Map<String, dynamic> toJson() => _$ProbeMatchToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<String> _typeList(Map<String, dynamic> value) =>
      value['\$'].toString().split(' ');

  static Map<String, String> _scopeMap(value) {
    return {
      for (var scope in value.split(','))
        scope.replaceAll('onvif://www.onvif.org/', '').replaceAll(
            RegExp('/([^/]+)/?\$'), ''): scope.replaceAll(RegExp('.*/'), '')
    };
  }
}
