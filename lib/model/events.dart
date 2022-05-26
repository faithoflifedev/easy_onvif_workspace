import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'events.g.dart';

///Event capabilities
@JsonSerializable()
class Events {
  ///Event service URI.
  @JsonKey(name: 'XAddr', fromJson: OnvifUtil.mappedToString)
  final dynamic xAddr;

  Events(this.xAddr);

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);

  Map<String, dynamic> toJson() => _$EventsToJson(this);
}
