import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/snackbar_helper.dart';
import 'package:template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/features/auth/presentation/bloc/auth_state.dart';
import 'package:template/features/auth/presentation/sections/auth_form.dart';
import 'package:template/features/auth/presentation/sections/auth_header.dart';
import 'package:template/features/auth/presentation/sections/auth_toggle.dart';
import 'package:template/i18n/strings.g.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.dark.bg,
      ),
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
          _ => const Center(
            child: Column(
              children: [
                Header(),
                Gap(48),
                AuthForm(),
                Spacer(),
                AuthToggle(),
              ],
            ),
          ),
        },
      ),
    );
  }
}
