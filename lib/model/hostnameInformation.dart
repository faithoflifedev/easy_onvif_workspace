import 'package:json_annotation/json_annotation.dart';

part 'hostnameInformation.g.dart';

@JsonSerializable()
class HostnameInformation {
  @JsonKey(name: 'FromDHCP')
  final dynamic xmlFromDhcp;

  @JsonKey(name: 'Name')
  final dynamic xmlName;

  bool get fromDHCP => xmlFromDhcp['\$'];

  String get h264Profile => xmlName['\$'];

  HostnameInformation({required this.xmlFromDhcp, this.xmlName});

  factory HostnameInformation.fromJson(Map<String, dynamic> json) =>
      _$HostnameInformationFromJson(json);

  Map<String, dynamic> toJson() => _$HostnameInformationToJson(this);
}
