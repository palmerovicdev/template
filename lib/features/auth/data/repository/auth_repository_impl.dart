import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:template/core/error/error_handler.dart';
import 'package:template/features/auth/domain/entity/user_entity.dart';
import 'package:template/features/auth/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<Either<ErrorState, UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // TODO: Implementar autenticación real con email y password
      // Por ahora, simulamos un login exitoso
      final user = await Future.delayed(
        const Duration(milliseconds: 300),
        () => UserEntity(
          id: '123',
          email: email,
          displayName: 'Test User',
          avatarUrl: 'https://example.com/avatar.jpg',
        ),
      );
      return Right(user);
    } on Exception catch (e, _) {
      return Left(DataClientError(e));
    }
  }

  @override
  Future<Either<ErrorState, UserEntity?>> getCurrentUser() async {
    try {
      final user = await Future.delayed(
        const Duration(milliseconds: 500),
        () => null,
      );
      return Right(user);
    } on Exception catch (e, _) {
      return Left(DataClientError(e));
    }
  }

  @override
  Future<Either<ErrorState, void>> signOut() async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      return const Right(null);
    } on Exception catch (e, _) {
      return Left(DataClientError(e));
    }
  }
}
