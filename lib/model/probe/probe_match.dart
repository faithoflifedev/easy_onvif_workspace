import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loggy/loggy.dart';

import 'endpoint_reference.dart';

part 'probe_match.g.dart';

@JsonSerializable(explicitToJson: true)
class ProbeMatch with UiLoggy {
  @JsonKey(name: 'EndpointReference')
  final EndpointReference endpointReference;

  @JsonKey(name: 'Types', fromJson: _toList)
  final List<String> types;

  @JsonKey(name: 'Scopes', fromJson: _toList)
  final List<String> scopes;

  @JsonKey(name: 'XAddrs', fromJson: _toList)
  final List<String> xaddrs;

  @JsonKey(name: 'MetadataVersion', fromJson: OnvifUtil.mappedToString)
  final String metadataVersion;

  final _profiles = <String>[];

  String? _location;
  String? _type;
  String? _name;
  String? _hardware;

  String get xaddr => xaddrs.first;

  String get location => _location ?? '';

  String get type => _type ?? '';

  String get name => _name ?? '';

  String get hardware => _hardware ?? '';

  List<String> get profiles => _profiles;

  ProbeMatch(
      {required this.endpointReference,
      required this.types,
      required this.scopes,
      required this.xaddrs,
      required this.metadataVersion}) {
    _setCommonScopes();
  }

  void _setCommonScopes() {
    for (var scope in scopes) {
      try {
        final scopeAsUri = scope.parseUri;

        var pathSegments = List<String>.from(scopeAsUri.pathSegments);

        var identifier = pathSegments[0];

        pathSegments.removeAt(0);

        var data = pathSegments.join('/');

        switch (identifier) {
          case 'location':
            _location = data;

            break;

          case 'type':
            _type = data;

            break;

          case 'name':
            _name = data;

            break;

          case 'hardware':
            _hardware = data;

            break;

          case 'profile':
            _profiles.add(data);

            break;
        }
      } catch (exception) {
        loggy.error(exception);
      }
    }
  }

  factory ProbeMatch.fromJson(Map<String, dynamic> json) =>
      _$ProbeMatchFromJson(json);

  Map<String, dynamic> toJson() => _$ProbeMatchToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<String> _toList(Map<String, dynamic> value) =>
      OnvifUtil.mappedToString(value).toString().split(RegExp('[ |,]'));
}
