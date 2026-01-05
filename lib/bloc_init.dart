import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/theme/bloc/theme_bloc.dart';
import 'package:template/features/auth/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:template/features/auth/presentation/bloc/otp/otp_bloc.dart';
import 'package:template/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:template/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:template/features/auth/presentation/bloc/sign_in/sign_in_event.dart';
import 'package:template/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';

class BlocInit extends StatelessWidget {
  const BlocInit({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SignInBloc>()..add(GetCurrentUserEvent())),
        BlocProvider(create: (_) => sl<SignUpBloc>()),
        BlocProvider(create: (_) => sl<ForgotPasswordBloc>()),
        BlocProvider(create: (_) => sl<ResetPasswordBloc>()),
        BlocProvider(create: (_) => sl<OtpBloc>()),
        BlocProvider(create: (_) => sl<ThemeBloc>()),
      ],
      child: child ?? const Placeholder(),
    );
  }
}
