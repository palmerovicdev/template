part of 'forgot_password_bloc.dart';

enum ForgotPasswordStatus {
  initial,
  loading,
  validateCode,
  success,
  failed,
}

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState._({
    required this.status,
    this.email,
    this.errorMessage,
  });

  factory ForgotPasswordState.initial() => const ForgotPasswordState._(status: ForgotPasswordStatus.initial);
  final ForgotPasswordStatus status;
  final String? email;
  final String? errorMessage;

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
    String? email,
    String? errorMessage,
  }) {
    return ForgotPasswordState._(
      status: status ?? this.status,
      email: email ?? this.email,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, email, errorMessage];
}

