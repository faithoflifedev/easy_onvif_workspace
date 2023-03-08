import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_zone.g.dart';

///Timezone information in Posix format.
@JsonSerializable()
class TimeZone {
  ///Posix timezone string.
  @JsonKey(name: 'TZ', fromJson: OnvifUtil.nullableMappedToString)
  final String? tz;

  TimeZone({required this.tz});

  factory TimeZone.fromJson(Map<String, dynamic> json) =>
      _$TimeZoneFromJson(json);

  Map<String, dynamic> toJson() => _$TimeZoneToJson(this);

  @override
  String toString() => json.encode(toJson());
}
