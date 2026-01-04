abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({
    required this.email,
    required this.password,
  });
}

class GetCurrentUserEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}
