import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:template/features/auth/domain/entity/user_entity.dart';
import 'package:template/features/auth/domain/repository/auth_repository.dart';

part 'otp_event.dart';
part 'otp_state.dart';

@lazySingleton
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc(this.authRepository) : super(OtpState.initial()) {
    on<VerifyOtp>(_onVerifyOtp);
  }

  final AuthRepository authRepository;

  Future<void> _onVerifyOtp(
    VerifyOtp event,
    Emitter<OtpState> emit,
  ) async {
    emit(state.copyWith(status: OtpStatus.loading));
    final result = await authRepository.verifyOTP(
      email: event.email,
      otp: event.otp,
    );
    result.fold(
      (failure) => emit(state.copyWith(status: OtpStatus.failed, errorMessage: failure.errorMessage)),
      (user) {
        emit(state.copyWith(status: OtpStatus.success, user: user));
      },
    );
  }
}
