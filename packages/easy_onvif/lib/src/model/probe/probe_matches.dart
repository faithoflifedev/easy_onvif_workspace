import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'probe_match.dart';

part 'probe_matches.g.dart';

@JsonSerializable()
class ProbeMatches {
  @JsonKey(name: 'ProbeMatch', fromJson: _fromJson)
  final List<ProbeMatch> probeMatches;

  ProbeMatches({required this.probeMatches});

  factory ProbeMatches.fromJson(Map<String, dynamic> json) =>
      _$ProbeMatchesFromJson(json);

  Map<String, dynamic> toJson() => _$ProbeMatchesToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<ProbeMatch> _fromJson(dynamic json) =>
      OnvifUtil.jsonList<ProbeMatch>(
        json,
        (json) => ProbeMatch.fromJson(json as Map<String, dynamic>),
      );
}
