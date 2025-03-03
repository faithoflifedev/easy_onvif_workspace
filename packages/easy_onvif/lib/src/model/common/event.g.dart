// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
  filter: json['Filter'],
  subscriptionPolicy: json['SubscriptionPolicy'],
);

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
  'Filter': instance.filter,
  'SubscriptionPolicy': instance.subscriptionPolicy,
};
