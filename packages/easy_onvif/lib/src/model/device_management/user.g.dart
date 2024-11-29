// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: OnvifUtil.stringMappedFromXml(
          json['Username'] as Map<String, dynamic>),
      password: OnvifUtil.nullableStringMappedFromXml(
          json['Password'] as Map<String, dynamic>?),
      userLevel:
          User._mappedToUserLevel(json['UserLevel'] as Map<String, dynamic>),
      extension: json['Extension'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Username': instance.username,
      'Password': instance.password,
      'UserLevel': _$UserLevelEnumMap[instance.userLevel]!,
      'Extension': instance.extension,
    };

const _$UserLevelEnumMap = {
  UserLevel.administrator: 'Administrator',
  UserLevel.operator: 'Operator',
  UserLevel.user: 'User',
  UserLevel.anonymous: 'Anonymous',
  UserLevel.extended: 'Extended',
};
