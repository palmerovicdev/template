import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/theme/app_constants.dart';
import 'package:template/core/widgets/input_form_field.dart';
import 'package:template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/features/auth/presentation/bloc/auth_event.dart';
import 'package:template/i18n/strings.g.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      sl<AuthBloc>().add(
        SignInEvent(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              InputFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.email_required;
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return t.email_invalid;
                  }
                  return null;
                },
                hintText: t.email_hint,
                prefixIcon: Icons.email_outlined,
              ),
              const Gap(16),

              InputFormField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                hintText: t.password_hint,
                prefixIcon: Icons.lock_outlined,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.password_required;
                  }
                  if (value.length < 6) {
                    return t.password_too_short;
                  }
                  return null;
                },
              ),

              const Gap(24),

              SizedBox(
                width: double.infinity,
                height: AppConstants.componentHeight,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      const Icon(Icons.login, size: 24),
                      const SizedBox(width: 12),
                      Text(
                        t.sign_in,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 18,
                          fontWeight: .w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
