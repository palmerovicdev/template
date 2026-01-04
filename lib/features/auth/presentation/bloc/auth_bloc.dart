import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:template/features/auth/domain/repository/auth_repository.dart';
import 'package:template/features/auth/presentation/bloc/auth_event.dart';
import 'package:template/features/auth/presentation/bloc/auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(AuthState.initial()) {
    on<SignInEvent>(_onSignIn);
    on<GetCurrentUserEvent>(_onGetCurrentUser);
    on<SignOutEvent>(_onSignOut);
  }

  final AuthRepository authRepository;

  Future<void> _onSignIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    final result = await authRepository.signIn();
    result.fold(
      (failure) => emit(state.copyWith(status: AuthStatus.failure, errorMessage: failure.errorMessage)),
      (user) => emit(state.copyWith(status: AuthStatus.authenticated, user: user)),
    );
  }

  Future<void> _onGetCurrentUser(
    GetCurrentUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    final result = await authRepository.getCurrentUser();
    result.fold(
      (failure) => emit(state.copyWith(status: AuthStatus.failure, errorMessage: failure.errorMessage)),
      (user) {
        if (user != null) {
          emit(state.copyWith(status: AuthStatus.authenticated, user: user));
        } else {
          emit(state.copyWith(status: AuthStatus.unauthenticated, user: null));
        }
      },
    );
  }

  Future<void> _onSignOut(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    final result = await authRepository.signOut();
    result.fold(
      (failure) => emit(state.copyWith(status: AuthStatus.failure, errorMessage: failure.errorMessage)),
      (_) => emit(AuthState.initial().copyWith(status: AuthStatus.logout)),
    );
  }
}
