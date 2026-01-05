import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/core/utils/logger.dart';
import 'package:template/core/widgets/custom_button.dart';
import 'package:template/core/widgets/input_form_field.dart';
import 'package:template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/features/auth/presentation/bloc/auth_event.dart';
import 'package:template/i18n/strings.g.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    if (_isEmailValid && _isPasswordValid) {
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

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            InputFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              isValid: (value) {
                if (value == null || value.isEmpty) {
                  setState(() => _isEmailValid = false);
                  return false;
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  setState(() => _isEmailValid = false);
                  return false;
                }
                setState(() => _isEmailValid = true);
                return true;
              },
              hintText: t.email_hint,
              prefixIcon: Iconic.envelope,
            ),
            const Gap(16),
            InputFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              hintText: t.password_hint,
              prefixIcon: Iconic.lock,
              prefixSize: 18.0,
              isPassword: true,
              isValid: (value) {
                if (value == null || value.isEmpty) {
                  setState(() => _isPasswordValid = false);
                  return false;
                }
                if (value.length < 6) {
                  setState(() => _isPasswordValid = false);
                  return false;
                }
                setState(() => _isPasswordValid = true);
                return true;
              },
            ),
            Align(
              alignment: .topRight,
              child: TextButton(
                style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(t.forgot_password),
              ),
            ),
            const Gap(24),
            CustomButton(
              text: t.sign_in,
              enabled: _isEmailValid && _isPasswordValid,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 18,
                letterSpacing: 0.5,
              ),
              onPressed: () {
                _handleSignIn();
              },
              icon: Iconic.sign_in_alt,
            ),
            const Gap(64),
            Align(
              alignment: .center,
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
                          context.push(Routes.signUp.path);
                        },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
