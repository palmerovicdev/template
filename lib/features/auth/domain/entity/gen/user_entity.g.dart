// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  id: json['id'] as String,
  email: json['email'] as String?,
  displayName: json['display_name'] as String?,
  avatarUrl: json['avatar_url'] as String?,
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'display_name': instance.displayName,
  'avatar_url': instance.avatarUrl,
};
