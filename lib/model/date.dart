import 'package:json_annotation/json_annotation.dart';

part 'date.g.dart';

@JsonSerializable(explicitToJson: true)
class Date {
  @JsonKey(name: 'Year')
  final dynamic xmlYear;

  @JsonKey(name: 'Month')
  final dynamic xmlMonth;

  @JsonKey(name: 'Day')
  final dynamic xmlDay;

  int get year => int.parse(xmlYear['\$']);

  int get month => int.parse(xmlMonth['\$']);

  int get day => int.parse(xmlDay['\$']);

  Date(this.xmlYear, this.xmlMonth, this.xmlDay);

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);
}
