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

  @override
  Future<Either<ErrorState<dynamic>, UserEntity>> signUp({required String email, required String password, required String name}) async {
    try {
      final user = await Future.delayed(
        const Duration(milliseconds: 300),
        () => UserEntity(
          id: '456',
          email: email,
          displayName: name,
          avatarUrl: 'https://example.com/avatar.jpg',
        ),
      );
      return Right(user);
    } on Exception catch (e, _) {
      return Left(DataClientError(e));
    }
  }

  @override
  Future<Either<ErrorState, UserEntity>> verifyOTP({required String email, required String otp}) async {
    try {
      // TODO: Implementar verificación OTP real
      // Por ahora, simulamos una verificación exitosa
      final user = await Future.delayed(
        const Duration(milliseconds: 300),
        () => UserEntity(
          id: '789',
          email: email,
          displayName: 'OTP User',
          avatarUrl: 'https://example.com/avatar.jpg',
        ),
      );
      return Right(user);
    } on Exception catch (e, _) {
      return Left(DataClientError(e));
    }
  }

  @override
  Future<Either<ErrorState, void>> requestPasswordResetCode({required String email}) async {
    try {
      // TODO: Implementar envío real de código de recuperación
      // Por ahora, simulamos un envío exitoso
      await Future.delayed(const Duration(milliseconds: 300));
      return const Right(null);
    } on Exception catch (e, _) {
      return Left(DataClientError(e));
    }
  }

  @override
  Future<Either<ErrorState, void>> validatePasswordResetCode({required String code}) async {
    try {
      // TODO: Implementar validación real de código de recuperación
      // Por ahora, simulamos una validación exitosa
      await Future.delayed(const Duration(milliseconds: 300));
      return const Right(null);
    } on Exception catch (e, _) {
      return Left(DataClientError(e));
    }
  }

  @override
  Future<Either<ErrorState, void>> resetPassword({required String email, required String newPassword}) async {
    try {
      // TODO: Implementar reset de contraseña real
      // Por ahora, simulamos un reset exitoso
      await Future.delayed(const Duration(milliseconds: 300));
      return const Right(null);
    } on Exception catch (e, _) {
      return Left(DataClientError(e));
    }
  }
}
