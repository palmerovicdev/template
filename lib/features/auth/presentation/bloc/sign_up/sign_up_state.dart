part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState._({
    required this.status,
    this.errorMessage,
    this.user,
  });

  factory SignUpState.initial() => const SignUpState._(status: SignUpStatus.initial);
  final SignUpStatus status;
  final UserEntity? user;
  final String? errorMessage;

  SignUpState copyWith({
    SignUpStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return SignUpState._(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage];
}

enum SignUpStatus {
  initial,
  loading,
  success,
  failed,
}
