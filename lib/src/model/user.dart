import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'Username', fromJson: OnvifUtil.mappedToString)
  final String username;

  @JsonKey(name: 'Password', fromJson: OnvifUtil.nullableMappedToString)
  final String? password;

  @JsonKey(name: 'UserLevel', fromJson: OnvifUtil.mappedToString)
  final String userLevel;

  User({required this.username, this.password, required this.userLevel});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() => json.encode(toJson());
}
