part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent {}

class RequestCode extends ForgotPasswordEvent {
  RequestCode({
    required this.email,
  });

  final String email;
}

class ValidateCode extends ForgotPasswordEvent {
  ValidateCode({
    required this.code,
  });

  final String code;
}