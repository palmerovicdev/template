import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/widgets/custom_button.dart';
import 'package:template/core/widgets/input_form_field.dart';
import 'package:template/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:template/i18n/strings.g.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key, required this.email});

  final String email;

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();
  bool _isPasswordValid = false;
  bool _isPassword2Valid = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _password2Controller.dispose();
    super.dispose();
  }

  void _handleResetPassword() {
    if (_isPasswordValid && _isPassword2Valid && _passwordController.text == _password2Controller.text) {
      sl<ResetPasswordBloc>().add(
        ResetPassword(
          email: widget.email,
          newPassword: _passwordController.text,
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
              text: t.reset_password,
              enabled: _isPasswordValid && _isPassword2Valid && _passwordController.text == _password2Controller.text,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 18,
                letterSpacing: 0.5,
              ),
              onPressed: () {
                _handleResetPassword();
              },
              icon: Iconic.lock,
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
