abstract class AuthEvent {}

class SignInEvent extends AuthEvent {}

class GetCurrentUserEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}
