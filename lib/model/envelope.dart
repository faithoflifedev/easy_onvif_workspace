import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'body.dart';
import 'header.dart';

part 'envelope.g.dart';

@JsonSerializable(explicitToJson: true)
class Envelope {
  @JsonKey(name: 'Body')
  final Body body;

  @JsonKey(name: 'Header')
  final Header? header;

  Envelope({required this.body, this.header});

  factory Envelope.fromJson(Map<String, dynamic> json) =>
      _$EnvelopeFromJson(json);

  factory Envelope.fromXml(String xml) =>
      Envelope.fromJson(OnvifUtil.xmlToMap(xml));

  Map<String, dynamic> toJson() => _$EnvelopeToJson(this);
}
