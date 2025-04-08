import 'package:json_annotation/json_annotation.dart';

part 'events.g.dart';

@JsonSerializable()
class Events {
  @JsonKey(name: 'Filter')
  dynamic filter;

  @JsonKey(name: 'SubscriptionPolicy')
  dynamic subscriptionPolicy;

  Events({this.filter, this.subscriptionPolicy});

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);

  Map<String, dynamic> toJson() => _$EventsToJson(this);
}
