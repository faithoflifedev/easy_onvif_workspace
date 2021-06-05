import 'package:json_annotation/json_annotation.dart';

import 'probe/appSequence.dart';
//import 'header.dart';

part 'header.g.dart';

@JsonSerializable(explicitToJson: true)
class Header {
  @JsonKey(name: 'AppSequence')
  final AppSequence appSequence;

  @JsonKey(name: 'MessageID')
  final dynamic xmlMessageID;

  @JsonKey(name: 'RelatesTo')
  final dynamic xmlRelatesTo;

  @JsonKey(name: 'To')
  final dynamic xmlTo;

  @JsonKey(name: 'Action')
  final dynamic xmlAction;

  int get messageID => int.parse(xmlMessageID['\$']);

  String get relatesTo => xmlRelatesTo['\$'];

  String get to => xmlTo['\$'];

  String get action => xmlAction['\$'];

  Header(this.appSequence, this.xmlMessageID, this.xmlRelatesTo, this.xmlTo,
      this.xmlAction);

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}
