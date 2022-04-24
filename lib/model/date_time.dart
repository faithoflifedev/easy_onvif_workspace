import 'package:json_annotation/json_annotation.dart';

import 'date.dart';
import 'time.dart';

part 'date_time.g.dart';

///Date and time
@JsonSerializable(explicitToJson: true)
class OnvifDateTime {
  @JsonKey(name: 'Time')
  final Time time;

  @JsonKey(name: 'Date')
  final Date date;

  OnvifDateTime(this.time, this.date);

  factory OnvifDateTime.fromJson(Map<String, dynamic> json) =>
      _$OnvifDateTimeFromJson(json);

  Map<String, dynamic> toJson() => _$OnvifDateTimeToJson(this);

  DateTime get dateTime {
    return DateTime.utc(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
      time.second,
    );
  }
}
