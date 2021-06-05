import 'package:json_annotation/json_annotation.dart';

import 'version.dart';

part 'service.g.dart';

@JsonSerializable(explicitToJson: true)
class Service {
  @JsonKey(name: 'Namespace')
  final dynamic xmlNameSpace;

  @JsonKey(name: 'XAddr')
  final dynamic xmlXAddr;

  @JsonKey(name: 'Version')
  final Version version;

  int get nameSpace => xmlNameSpace['\$'];

  int get xAddr => xmlXAddr['\$'];

  Service(this.xmlNameSpace, this.xmlXAddr, this.version);

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
