import 'package:go_router/go_router.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/features/auth/presentation/auth_page.dart';
import 'package:template/features/home/home_page.dart';
import 'package:template/features/splash_page.dart';

var router = GoRouter(
  initialLocation: Routes.splash.path,
  routes: [
    GoRoute(path: Routes.splash.path, builder: (_, _) => const SplashPage()),
    GoRoute(path: Routes.login.path, builder: (_, _) => const AuthPage()),
    GoRoute(path: Routes.home.path, builder: (_, _) => const HomePage()),
  ],
);
