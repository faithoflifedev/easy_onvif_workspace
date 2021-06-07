import 'package:json_annotation/json_annotation.dart';

part 'events.g.dart';

///Event capabilities
@JsonSerializable(explicitToJson: true)
class Events {
  @JsonKey(name: 'XAddr')
  final dynamic xmlXAddr;

  ///Event service URI.
  String get xAddr => xmlXAddr['\$'];

  Events(this.xmlXAddr);

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);

  Map<String, dynamic> toJson() => _$EventsToJson(this);
}
