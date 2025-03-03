import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'users_response.g.dart';

@JsonSerializable()
class GetUsersResponse {
  @JsonKey(name: 'User', fromJson: _fromJson)
  final List<User> users;

  GetUsersResponse({required this.users});

  factory GetUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUsersResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<User> _fromJson(dynamic json) => OnvifUtil.jsonList<User>(
    json,
    (json) => User.fromJson(json as Map<String, dynamic>),
  );
}
