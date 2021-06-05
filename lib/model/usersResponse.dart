import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'usersResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetUsersResponse {
  @JsonKey(name: 'User')
  final List<User> users;

  GetUsersResponse({required this.users});

  factory GetUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUsersResponseToJson(this);
}
