import 'package:easy_enum/easy_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'Username')
  final dynamic mapUsername;

  @JsonKey(name: 'Password')
  final dynamic mapPassword;

  @JsonKey(name: 'UserLevel')
  final dynamic mapUserLevel;

  String get username => mapUsername['\$'];

  String get password => mapPassword['\$'];

  UserLevel get userLevel => mapUserLevel['\$'].userLevel;

  User(
      {required this.mapUsername,
      required this.mapPassword,
      required this.mapUserLevel});

  factory User.fromStrings(
          String username, String password, UserLevel userLevel) =>
      User(
          mapUsername: {'\$': username},
          mapPassword: {'\$': username},
          mapUserLevel: {'\$': userLevel.value});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@EasyEnum()
enum UserLevel { administrator, operator, user, anonymous, extended }
