import 'dart:convert';

import 'package:easy_onvif/soap.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source_token.g.dart';

/// This field shall be a reference to the source of the data. The type of the
/// source is determined by the attribute Type in the SourceToken structure. If
/// Type is http://www.onvif.org/ver10/schema/Receiver, the token is a
/// ReceiverReference. In this case the device shall receive the data over the
/// network. If Type is http://www.onvif.org/ver10/schema/Profile, the token
/// identifies a media profile, instructing the device to obtain data from a
/// profile that exists on the local device.
@JsonSerializable()
class SourceToken {
  @JsonKey(name: '@Type')
  final String? type;

  @JsonKey(name: 'Token', fromJson: OnvifUtil.mappedToString)
  final String token;

  SourceToken({
    this.type,
    required this.token,
  });

  factory SourceToken.fromJson(Map<String, dynamic> json) =>
      _$SourceTokenFromJson(json);

  Map<String, dynamic> toJson() => _$SourceTokenToJson(this);

  @override
  String toString() => json.encode(toJson());

  void toXml() {
    Transport.builder.element('SourceToken', nest: () {
      Transport.builder.namespace(Xmlns.tt);

      if (type != null) {
        Transport.builder.element('Type', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.text(type!);
        });

        Transport.builder.element('Token', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.text(token);
        });
      }
    });
  }
}
