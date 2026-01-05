import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/core/utils/snackbar_helper.dart';
import 'package:template/features/auth/presentation/bloc/otp/otp_bloc.dart';
import 'package:template/features/auth/presentation/sections/otp/otp_form.dart';
import 'package:template/features/auth/presentation/sections/otp/otp_logo.dart';
import 'package:template/features/auth/presentation/sections/otp/otp_title.dart';
import 'package:template/i18n/strings.g.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OtpBloc, OtpState>(
        listener: (context, state) {
          switch (state.status) {
            case OtpStatus.failed:
              if (state.errorMessage != null) {
                SnackbarHelper.showError(title: t.error_message, message: state.errorMessage!);
              }
              break;
            case OtpStatus.success:
              SnackbarHelper.showSuccess(title: t.auth_success, message: t.auth_success);
              context.go(Routes.home.path);
            case _:
          }
        },
        builder: (context, state) {
          if (state.status == OtpStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 3,
              ),
            );
          }
          return CustomScrollView(
            slivers: [
              const OtpLogo(),
              const OtpTitle(),
              OtpForm(email: email),
            ],
          );
        },
      ),
    );
  }
}
