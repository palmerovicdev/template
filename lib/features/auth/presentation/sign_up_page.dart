import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/features/auth/presentation/bloc/sign_up_bloc.dart';
import 'package:template/features/auth/presentation/sections/sign_up/sign_up_form.dart';
import 'package:template/features/auth/presentation/sections/sign_up/sign_up_logo.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {},
        builder: (context, state) {
          return const CustomScrollView(
            slivers: [
              SignUpLogo(),
              SignUpForm(),
            ],
          );
        },
      ),
    );
  }
}
