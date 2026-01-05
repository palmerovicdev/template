import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/core/utils/snackbar_helper.dart';
import 'package:template/core/widgets/loading_state.dart';
import 'package:template/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:template/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:template/features/auth/presentation/bloc/sign_in/sign_in_event.dart';
import 'package:template/features/auth/presentation/sections/reset_password/reset_password_form.dart';
import 'package:template/features/auth/presentation/sections/reset_password/reset_password_logo.dart';
import 'package:template/features/auth/presentation/sections/reset_password/reset_password_title.dart';
import 'package:template/i18n/strings.g.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          switch (state.status) {
            case ResetPasswordStatus.failed:
              if (state.errorMessage != null) {
                SnackbarHelper.showError(title: t.error_message, message: state.errorMessage!);
              }
              break;
            case ResetPasswordStatus.success:
              SnackbarHelper.showSuccess(title: t.reset_password_success, message: t.reset_password_success_message);
              context.go(Routes.login.path);
              sl<SignInBloc>().add(ResetState());
            case _:
          }
        },
        builder: (context, state) => switch (state.status) {
          ResetPasswordStatus.loading => const LoadingState(),
          _ => CustomScrollView(
            slivers: [
              const ResetPasswordLogo(),
              const ResetPasswordTitle(),
              ResetPasswordForm(email: email),
            ],
          ),
        },
      ),
    );
  }
}
