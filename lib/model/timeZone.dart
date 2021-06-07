import 'package:json_annotation/json_annotation.dart';

part 'timeZone.g.dart';

///Timezone information in Posix format.
@JsonSerializable(explicitToJson: true)
class TimeZone {
  @JsonKey(name: 'TZ')
  final dynamic xmlTz;

  ///Posix timezone string.
  String get tz => xmlTz['\$'];

  TimeZone(this.xmlTz);

  factory TimeZone.fromJson(Map<String, dynamic> json) =>
      _$TimeZoneFromJson(json);

  Map<String, dynamic> toJson() => _$TimeZoneToJson(this);
}
