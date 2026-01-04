import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/user_entity.freezed.dart';
part 'gen/user_entity.g.dart';

@freezed
sealed class UserEntity extends Equatable with _$UserEntity {
  const factory UserEntity({
    required String id,
    String? email,
    String? displayName,
    String? avatarUrl,
  }) = _UserEntity;

  const UserEntity._();

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

  @override
  List<Object?> get props => [id, email, displayName, avatarUrl];
}
