import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'users_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetUsersResponse {
  @JsonKey(name: 'User', fromJson: _userConvertor)
  final List<User> users;

  GetUsersResponse({required this.users});

  factory GetUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUsersResponseToJson(this);

  static List<User> _userConvertor(dynamic json) {
    if (json is List) {
      return json.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
    }

    return [User.fromJson(json as Map<String, dynamic>)];
  }

  @override
  String toString() => json.encode(toJson());
}
