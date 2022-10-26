// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username:
          OnvifUtil.mappedToString(json['Username'] as Map<String, dynamic>),
      password: OnvifUtil.nullableMappedToString(
          json['Password'] as Map<String, dynamic>?),
      userLevel:
          OnvifUtil.mappedToString(json['UserLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Username': instance.username,
      'Password': instance.password,
      'UserLevel': instance.userLevel,
    };
