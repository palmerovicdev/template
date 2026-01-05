  part of 'otp_bloc.dart';

@immutable
sealed class OtpEvent {}

final class VerifyOtp extends OtpEvent {
  VerifyOtp({
    required this.email,
    required this.otp,
  });

  final String email;
  final String otp;
}
