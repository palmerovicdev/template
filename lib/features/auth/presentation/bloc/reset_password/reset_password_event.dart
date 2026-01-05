part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {}

final class ResetPassword extends ResetPasswordEvent {
  ResetPassword({
    required this.email,
    required this.newPassword,
  });

  final String email;
  final String newPassword;
}
