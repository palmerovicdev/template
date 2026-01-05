import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:template/features/auth/domain/repository/auth_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

@lazySingleton
class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(this.authRepository) : super(ForgotPasswordState.initial()) {
    on<RequestCode>(_onRequestCode);
    on<ValidateCode>(_onValidateCode);
    on<ResetState>(_onResetState);
  }

  final AuthRepository authRepository;

  Future<void> _onRequestCode(
    RequestCode event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading, email: event.email));
    final result = await authRepository.requestPasswordResetCode(email: event.email);
    result.fold(
      (failure) => emit(state.copyWith(status: ForgotPasswordStatus.failed, errorMessage: failure.errorMessage)),
      (_) => emit(state.copyWith(status: ForgotPasswordStatus.validateCode)),
    );
  }

  Future<void> _onValidateCode(
    ValidateCode event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));
    final result = await authRepository.validatePasswordResetCode(code: event.code);
    result.fold(
      (failure) => emit(state.copyWith(status: ForgotPasswordStatus.failed, errorMessage: failure.errorMessage)),
      (_) => emit(state.copyWith(status: ForgotPasswordStatus.success)),
    );
  }
  Future<void> _onResetState(
    ResetState event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(ForgotPasswordState.initial());
  }
}
