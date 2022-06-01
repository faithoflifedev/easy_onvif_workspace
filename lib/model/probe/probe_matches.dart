import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'probe_match.dart';

part 'probe_matches.g.dart';

@JsonSerializable()
class ProbeMatches {
  @JsonKey(name: 'ProbeMatch', fromJson: _probeMatchConverter)
  final List<ProbeMatch> probeMatches;

  ProbeMatches({required this.probeMatches});

  factory ProbeMatches.fromJson(Map<String, dynamic> json) =>
      _$ProbeMatchesFromJson(json);

  Map<String, dynamic> toJson() => _$ProbeMatchesToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<ProbeMatch> _probeMatchConverter(dynamic json) {
    if (json is List) {
      return json
          .map((e) => ProbeMatch.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [ProbeMatch.fromJson(json as Map<String, dynamic>)];
  }
}
