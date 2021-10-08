// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// EasyEnumGenerator
// **************************************************************************

extension UserLevelExt on UserLevel {
  String get value =>
      ['administrator', 'operator', 'user', 'anonymous', 'extended'][index];
}

extension UserLevelTxe on String {
  UserLevel? get userLevel => {
        'administrator': UserLevel.administrator,
        'operator': UserLevel.operator,
        'user': UserLevel.user,
        'anonymous': UserLevel.anonymous,
        'extended': UserLevel.extended,
      }[this];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      mapUsername: json['Username'],
      mapPassword: json['Password'],
      mapUserLevel: json['UserLevel'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Username': instance.mapUsername,
      'Password': instance.mapPassword,
      'UserLevel': instance.mapUserLevel,
    };
