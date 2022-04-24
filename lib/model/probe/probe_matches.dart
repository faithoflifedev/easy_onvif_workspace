import 'package:json_annotation/json_annotation.dart';

import 'probe_match.dart';

part 'probe_matches.g.dart';

@JsonSerializable(explicitToJson: true)
class ProbeMatches {
  @JsonKey(name: 'ProbeMatch')
  final ProbeMatch probeMatch;

  ProbeMatches(this.probeMatch);

  factory ProbeMatches.fromJson(Map<String, dynamic> json) =>
      _$ProbeMatchesFromJson(json);

  Map<String, dynamic> toJson() => _$ProbeMatchesToJson(this);
}
