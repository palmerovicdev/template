abstract class SignInEvent {}

class SignIn extends SignInEvent {
  SignIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class GetCurrentUserEvent extends SignInEvent {}

class SignOutEvent extends SignInEvent {}
