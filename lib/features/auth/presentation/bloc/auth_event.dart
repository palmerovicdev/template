abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  SignInEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class GetCurrentUserEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}
