import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/logger.dart';
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
          _ => Center(
            child: Column(
              children: [
                const Header(),
                const Gap(48),

                const SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      AuthForm(),
                      Gap(24),
                    ],
                  ),
                ),
                const Spacer(),
                SafeArea(
                  child: Text.rich(
                    TextSpan(
                      text: t.dont_have_an_account,
                      children: [
                        TextSpan(
                          text: ' ${t.sign_up}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            letterSpacing: 0.5,
                            fontWeight: .bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              logi('Debug');
                              context.go(Routes.signUp.path);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        },
      ),
    );
  }
}
