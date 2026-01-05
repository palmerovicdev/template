part of 'reset_password_bloc.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState._({
    required this.status,
    this.errorMessage,
  });

  factory ResetPasswordState.initial() => const ResetPasswordState._(status: ResetPasswordStatus.initial);
  final ResetPasswordStatus status;
  final String? errorMessage;

  ResetPasswordState copyWith({
    ResetPasswordStatus? status,
    String? errorMessage,
  }) {
    return ResetPasswordState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}

enum ResetPasswordStatus {
  initial,
  loading,
  success,
  failed,
}
