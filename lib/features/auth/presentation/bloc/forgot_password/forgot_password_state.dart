part of 'forgot_password_bloc.dart';

enum ForgotPasswordStatus {
  initial,
  validateCode,
  success,
  failed,
}

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    required this.status,
    this.email,
    this.errorMessage,
  });

  factory ForgotPasswordState.initial() => const ForgotPasswordState(status: ForgotPasswordStatus.initial);
  final ForgotPasswordStatus status;
  final String? email;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, email, errorMessage];
}
