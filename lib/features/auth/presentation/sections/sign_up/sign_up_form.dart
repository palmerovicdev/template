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
import 'package:template/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:template/i18n/strings.g.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();
  final _nameController = TextEditingController();
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isNameValid = false;
  bool _isPassword2Valid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _password2Controller.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (_isEmailValid && _isPasswordValid && _isPassword2Valid && _isNameValid && _passwordController.text == _password2Controller.text) {
      sl<SignUpBloc>().add(
        SignUp(
          name: _nameController.text.trim(),
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
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate.fixed(
          [
            const Gap(28),
            InputFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              isValid: (value) {
                if (value == null || value.isEmpty) {
                  setState(() => _isNameValid = false);
                  return false;
                }
                setState(() => _isNameValid = true);
                return true;
              },
              hintText: t.name_hint,
              prefixIcon: Iconic.user,
            ),
            const Gap(16),
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
            const Gap(16),
            InputFormField(
              controller: _password2Controller,
              keyboardType: TextInputType.visiblePassword,
              hintText: t.repeat_password_hint,
              prefixIcon: Iconic.lock,
              prefixSize: 18.0,
              isPassword: true,
              isValid: (value) {
                if (value == null || value.isEmpty) {
                  setState(() => _isPassword2Valid = false);
                  return false;
                }
                if (value.length < 6) {
                  setState(() => _isPassword2Valid = false);
                  return false;
                }
                setState(() => _isPassword2Valid = true);
                return true;
              },
            ),
            const Gap(24),
            CustomButton(
              text: t.sign_up,
              enabled: _isEmailValid && _isPasswordValid,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 18,
                letterSpacing: 0.5,
              ),
              onPressed: () {
                _handleSignUp();
              },
              icon: Iconic.sign_in,
            ),
            const Gap(64),
            Align(
              alignment: .center,
              child: Text.rich(
                TextSpan(
                  text: t.already_have_an_account,
                  children: [
                    TextSpan(
                      text: ' ${t.sign_in}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        letterSpacing: 0.5,
                        fontWeight: .bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          logi('Debug');
                          context.go(Routes.login.path);
                        },
                    ),
                  ],
                ),
              ),
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
