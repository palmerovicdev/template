import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/snackbar_helper.dart';
import 'package:template/core/widgets/loading_state.dart';
import 'package:template/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:template/features/auth/presentation/bloc/sign_in/sign_in_event.dart';
import 'package:template/features/auth/presentation/bloc/sign_in/sign_in_state.dart';
import 'package:template/features/auth/presentation/sections/sign_in/login_form.dart';
import 'package:template/features/auth/presentation/sections/sign_in/login_logo.dart';
import 'package:template/features/auth/presentation/sections/sign_in/login_title.dart';
import 'package:template/i18n/strings.g.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, AuthState>(
        listener: (context, state) {
          switch (state.status) {
            case .failure:
              if (state.errorMessage != null) {
                SnackbarHelper.showError(title: t.error_message, message: state.errorMessage!);
              }
              break;
            case .authenticated:
              SnackbarHelper.showSuccess(title: t.auth_success, message: t.auth_success);
              context.go(Routes.home.path);
            case _:
          }
        },
        builder: (context, state) => switch (state.status) {
          .loading || .authenticated => const LoadingState(),
          _ => const CustomScrollView(
            slivers: [
              LoginLogo(),
              LoginTitle(),
              LoginForm(),
            ],
          ),
        },
      ),
    );
  }
}
