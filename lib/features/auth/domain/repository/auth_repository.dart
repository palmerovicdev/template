import 'package:dartz/dartz.dart';
import 'package:template/core/error/error_handler.dart';
import 'package:template/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<ErrorState, UserEntity>> signIn({
    required String email,
    required String password,
  });

  Future<Either<ErrorState, UserEntity>> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<ErrorState, UserEntity?>> getCurrentUser();

  Future<Either<ErrorState, void>> signOut();
}
