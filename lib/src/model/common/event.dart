import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  @JsonKey(name: 'Filter')
  dynamic filter;

  @JsonKey(name: 'SubscriptionPolicy')
  dynamic subscriptionPolicy;

  Event({this.filter, this.subscriptionPolicy});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
