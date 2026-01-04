import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/snackbar_helper.dart';
import 'package:template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/features/auth/presentation/bloc/auth_state.dart';
import 'package:template/features/auth/presentation/sections/auth_form.dart';
import 'package:template/features/auth/presentation/sections/auth_header.dart';
import 'package:template/i18n/strings.g.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.light.text),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state.status) {
            case .failure:
              if (state.errorMessage != null) {
                SnackbarHelper.showError(
                  title: t.error_message,
                  message: state.errorMessage!,
                );
              }
              break;
            case .authenticated:
              SnackbarHelper.showSuccess(
                title: t.auth_success,
                message: t.auth_success,
              );
              break;
            case .initial:
            case .loading:
            case .unauthenticated:
            case .logout:
          }
        },
        builder: (context, state) => switch (state.status) {
          .loading || .authenticated => const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 3,
            ),
          ),
          _ => Center(
            child: Column(
              children: [
                const Header(),
                const Gap(48),

                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      const AuthForm(),
                      const Gap(24),

                      Row(
                        mainAxisAlignment: .spaceEvenly,
                        children: [
                          _buildFeature(context, Icons.security_rounded, 'Secure'),
                          _buildFeature(context, Icons.speed_rounded, 'Fast'),
                          _buildFeature(context, Icons.cloud_done_rounded, 'Cloud'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
            fontWeight: .w500,
          ),
        ),
      ],
    );
  }
}
