import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/core/utils/snackbar_helper.dart';
import 'package:template/core/widgets/loading_state.dart';
import 'package:template/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:template/features/auth/presentation/sections/sign_up/sign_up_form.dart';
import 'package:template/features/auth/presentation/sections/sign_up/sign_up_logo.dart';
import 'package:template/i18n/strings.g.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          switch (state.status) {
            case .failed:
              if (state.errorMessage != null) {
                SnackbarHelper.showError(title: t.error_message, message: state.errorMessage!);
              }
              break;
            case .success:
              SnackbarHelper.showSuccess(title: t.sign_up_success, message: t.sign_up_success);
              context.go(Routes.otp.path, extra: state.user!.email);
              sl<SignUpBloc>().add(ResetState());
            case _:
          }
        },
        builder: (context, state) => switch (state.status) {
          .loading => const LoadingState(),
          _ => const CustomScrollView(
            slivers: [
              SignUpLogo(),
              SignUpForm(),
            ],
          ),
        },
      ),
    );
  }
}
