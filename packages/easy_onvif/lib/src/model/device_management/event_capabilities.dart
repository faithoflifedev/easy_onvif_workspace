import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_capabilities.g.dart';

///Event capabilities
@JsonSerializable()
class EventCapabilities {
  ///Event service URI.
  @JsonKey(name: 'XAddr', fromJson: OnvifUtil.stringMappedFromXml)
  final dynamic xAddr;

  EventCapabilities(this.xAddr);

  factory EventCapabilities.fromJson(Map<String, dynamic> json) =>
      _$EventCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$EventCapabilitiesToJson(this);
}
