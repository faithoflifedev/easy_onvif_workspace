// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usersResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersResponse _$GetUsersResponseFromJson(Map<String, dynamic> json) =>
    GetUsersResponse(
      users: (json['User'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUsersResponseToJson(GetUsersResponse instance) =>
    <String, dynamic>{
      'User': instance.users.map((e) => e.toJson()).toList(),
    };
