import 'package:json_annotation/json_annotation.dart';

part 'timeZone.g.dart';

@JsonSerializable(explicitToJson: true)
class TimeZone {
  @JsonKey(name: 'TZ')
  final dynamic xmlTz;

  String get tz => xmlTz['\$'];

  TimeZone(this.xmlTz);

  factory TimeZone.fromJson(Map<String, dynamic> json) =>
      _$TimeZoneFromJson(json);

  Map<String, dynamic> toJson() => _$TimeZoneToJson(this);
}
