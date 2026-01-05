part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class SignUp extends SignUpEvent {
  SignUp({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;
}


final class ResetState extends SignUpEvent {}