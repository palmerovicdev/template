part of 'otp_bloc.dart';

class OtpState extends Equatable {
  const OtpState._({
    required this.status,
    this.errorMessage,
    this.user,
  });

  factory OtpState.initial() => const OtpState._(status: OtpStatus.initial);
  final OtpStatus status;
  final UserEntity? user;
  final String? errorMessage;

  OtpState copyWith({
    OtpStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return OtpState._(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage];
}

enum OtpStatus {
  initial,
  loading,
  success,
  failed,
}
