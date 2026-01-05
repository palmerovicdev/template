import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/core/utils/snackbar_helper.dart';
import 'package:template/features/auth/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:template/features/auth/presentation/sections/forgot_password/forgot_password_form.dart';
import 'package:template/features/auth/presentation/sections/forgot_password/forgot_password_logo.dart';
import 'package:template/features/auth/presentation/sections/forgot_password/forgot_password_title.dart';
import 'package:template/features/auth/presentation/sections/forgot_password/forgot_password_validate_code.dart';
import 'package:template/i18n/strings.g.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
          switch (state.status) {
            case ForgotPasswordStatus.failed:
              if (state.errorMessage != null) {
                SnackbarHelper.showError(title: t.error_message, message: state.errorMessage!);
              }
              break;
            case ForgotPasswordStatus.success:
              if (state.email != null) {
                context.go(Routes.resetPassword.path, extra: state.email);
                sl<ForgotPasswordBloc>().add(ResetState());
              }
            case _:
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const ForgotPasswordLogo(),
              const ForgotPasswordTitle(),
              if (state.status == ForgotPasswordStatus.loading)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.onSurface),
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                ),
              if (state.status == ForgotPasswordStatus.initial) const ForgotPasswordForm(),
              if (state.status == ForgotPasswordStatus.validateCode) const ForgotPasswordValidateCode(),
            ],
          );
        },
      ),
    );
  }
}
