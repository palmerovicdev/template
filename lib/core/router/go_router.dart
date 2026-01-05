import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/core/utils/logger.dart';
import 'package:template/features/auth/presentation/login_page.dart';
import 'package:template/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:template/features/auth/presentation/bloc/sign_in/sign_in_state.dart';
import 'package:template/features/auth/presentation/sign_up_page.dart';
import 'package:template/features/home/home_page.dart';
import 'package:template/features/splash_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final authStateNotifier = ValueNotifier<AuthState>(AuthState.initial());

var router = GoRouter(
  initialLocation: Routes.splash.path,
  navigatorKey: rootNavigatorKey,
  refreshListenable: authStateNotifier,
  observers: [_GoRouterObserver()],
  redirect: (context, state) {
    final bloc = sl<SignInBloc>();
    final isLogin = state.matchedLocation == Routes.login.path;
    final isSignUp = state.matchedLocation == Routes.signUp.path;
    final isAuthenticated = bloc.state.status == .authenticated;

    if (!isLogin && !isSignUp && !isAuthenticated) {
      return Routes.login.path;
    }

    return null;
  },
  routes: [
    GoRoute(path: Routes.splash.path, builder: (_, _) => const SplashPage()),
    GoRoute(path: Routes.login.path, builder: (_, _) => const LoginPage()),
    GoRoute(path: Routes.signUp.path, builder: (_, _) => const SignUpPage()),
    GoRoute(path: Routes.home.path, builder: (_, _) => const HomePage()),
  ],
);

class _GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    logi('Pushed route: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    logi('Popped route: ${route.settings.name}');
  }
}
