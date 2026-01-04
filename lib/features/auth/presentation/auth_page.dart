import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/core/utils/snackbar_helper.dart';
import 'package:template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/features/auth/presentation/bloc/auth_event.dart';
import 'package:template/features/auth/presentation/bloc/auth_state.dart';
import 'package:template/i18n/strings.g.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.failure && state.errorMessage != null) {
            SnackbarHelper.showError(
              title: t.error_message,
              message: state.errorMessage!,
            );
          }

          if (state.status == AuthStatus.authenticated) {
            SnackbarHelper.showSuccess(
              title: t.auth_success,
              message: t.auth_success,
            );
            context.go(Routes.home.path);
          }
        },
        builder: (context, state) {
          if (state.status == AuthStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 3,
              ),
            );
          }

          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.flash_on_rounded,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 48),

                    Text(
                      t.auth_title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),

                    Text(
                      t.auth_subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 64),

                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(SignInEvent());
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: colorScheme.onPrimaryContainer,
                          elevation: 0,
                          shadowColor: colorScheme.outline.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.login, size: 24),
                            const SizedBox(width: 12),
                            Text(
                              t.sign_in,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildFeature(context, Icons.security_rounded, 'Secure'),
                        _buildFeature(context, Icons.speed_rounded, 'Fast'),
                        _buildFeature(context, Icons.cloud_done_rounded, 'Cloud'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeature(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          size: 28,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
