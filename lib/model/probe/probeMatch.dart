import 'package:json_annotation/json_annotation.dart';

import 'endpointReference.dart';

part 'probeMatch.g.dart';

@JsonSerializable(explicitToJson: true)
class ProbeMatch {
  @JsonKey(name: 'EndpointReference')
  final EndpointReference endpointReference;

  @JsonKey(name: 'Types')
  final dynamic xmlTypes;

  @JsonKey(name: 'Scopes')
  final String xmlScopes;

  @JsonKey(name: 'XAddrs')
  final dynamic xmlXaddrs;

  @JsonKey(name: 'MetadataVersion')
  final dynamic xmlMetadataVersion;

  Map<String, String> _scopeMap = {};

  set xmlScopes(String scopes) {
    _scopeMap = Map.fromIterable(scopes.split(','),
        key: (item) => item
            .toString()
            .replaceAll('onvif://www.onvif.org/', '')
            .replaceAll(RegExp('/([^/]+)/?\$'), ''),
        value: (item) => item.toString().replaceAll(RegExp('.*/'), ''));
  }

  Map<String, String> get scopeMap => _scopeMap;

  List<String> get types => xmlTypes['\$'].toString().split(' ');

  // List<String> get scopes => xmlScopes['\$'].toString().split(' ');

  String get xAddrs => xmlXaddrs['\$'];

  String get metadataVersion => xmlMetadataVersion['\$'];

  ProbeMatch(this.endpointReference, this.xmlTypes, this.xmlScopes,
      this.xmlXaddrs, this.xmlMetadataVersion);

  factory ProbeMatch.fromJson(Map<String, dynamic> json) =>
      _$ProbeMatchFromJson(json);

  Map<String, dynamic> toJson() => _$ProbeMatchToJson(this);
}
