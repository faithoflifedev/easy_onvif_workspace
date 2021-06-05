import 'package:json_annotation/json_annotation.dart';

part 'networkProtocol.g.dart';

@JsonSerializable(explicitToJson: true)
class NetworkProtocol {
  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'Enabled')
  final dynamic xmlEnabled;

  @JsonKey(name: 'Port')
  final dynamic xmlPort;

  String get name => xmlName['\$'];

  bool get enabled => xmlEnabled['\$'].toLowerCase() == 'true';

  int get port => int.parse(xmlName['\$']);

  NetworkProtocol(this.xmlName, this.xmlEnabled, this.xmlPort);

  factory NetworkProtocol.fromJson(Map<String, dynamic> json) =>
      _$NetworkProtocolFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkProtocolToJson(this);
}
