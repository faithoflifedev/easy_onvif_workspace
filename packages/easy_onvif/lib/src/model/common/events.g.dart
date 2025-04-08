// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Events _$EventsFromJson(Map<String, dynamic> json) => Events(
  filter: json['Filter'],
  subscriptionPolicy: json['SubscriptionPolicy'],
);

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
  'Filter': instance.filter,
  'SubscriptionPolicy': instance.subscriptionPolicy,
};
