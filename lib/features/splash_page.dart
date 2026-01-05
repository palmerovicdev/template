import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:template/features/auth/presentation/bloc/sign_in/sign_in_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: BlocListener<SignInBloc, AuthState>(
        listener: (context, state) {
          if (state.status == .authenticated) {
            context.go(Routes.home.path);
          } else if (state.status == .unauthenticated) {
            context.go(Routes.login.path);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Icon(
                Iconic.bold_bold,
                size: 64,
                color: AppColors.light.text,
              ),
              const SizedBox(height: 24),

              Text(
                'Template',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: .bold,
                  color: AppColors.light.text,
                ),
              ),
              const SizedBox(height: 48),

              SizedBox(
                width: 42,
                height: 42,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.light.text,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
