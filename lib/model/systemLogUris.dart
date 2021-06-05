import 'package:json_annotation/json_annotation.dart';

part 'systemLogUris.g.dart';

@JsonSerializable()
class SystemLogUris {
  @JsonKey(name: 'Type')
  final dynamic xmlType;

  @JsonKey(name: 'Uri')
  final dynamic xmlUri;

  String get type => xmlType['\$'];

  SystemLogUris({required this.xmlType, this.xmlUri});

  factory SystemLogUris.fromJson(Map<String, dynamic> json) =>
      _$SystemLogUrisFromJson(json);

  Map<String, dynamic> toJson() => _$SystemLogUrisToJson(this);
}
