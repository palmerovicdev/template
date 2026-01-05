part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState._({
    required this.status,
    this.errorMessage,
  });

  factory SignUpState.initial() => const SignUpState._(status: SignUpStatus.initial);
  final SignUpStatus status;
  final String? errorMessage;

  SignUpState copyWith({
    SignUpStatus? status,
    String? errorMessage,
  }) {
    return SignUpState._(
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];

}

enum SignUpStatus {
  initial,
  loading,
  success,
  failed,
}