import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:template/features/auth/domain/repository/auth_repository.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

@lazySingleton
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc(this.authRepository) : super(ResetPasswordState.initial()) {
    on<ResetPassword>(_onResetPassword);
  }

  final AuthRepository authRepository;

  Future<void> _onResetPassword(
    ResetPassword event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(state.copyWith(status: ResetPasswordStatus.loading));
    final result = await authRepository.resetPassword(
      email: event.email,
      newPassword: event.newPassword,
    );
    result.fold(
      (failure) => emit(state.copyWith(status: ResetPasswordStatus.failed, errorMessage: failure.errorMessage)),
      (_) => emit(state.copyWith(status: ResetPasswordStatus.success)),
    );
  }
}
