import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:template/features/auth/domain/entity/user_entity.dart';
import 'package:template/features/auth/domain/repository/auth_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

@lazySingleton
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this.authRepository) : super(SignUpState.initial()) {
    on<SignUp>(_onSignUp);
  }

  final AuthRepository authRepository;

  Future<void> _onSignUp(
    SignUp event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(status: SignUpStatus.loading));
    final result = await authRepository.signUp(
      email: event.email,
      password: event.password,
      name: event.name,
    );
    result.fold(
      (failure) => emit(state.copyWith(status: SignUpStatus.failed, errorMessage: failure.errorMessage)),
      (user) {
        emit(state.copyWith(status: SignUpStatus.success, user: user));
      },
    );
  }
}
