import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/widgets/custom_button.dart';
import 'package:template/core/widgets/input_form_field.dart';
import 'package:template/features/auth/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:template/i18n/strings.g.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _emailController = TextEditingController();
  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleRequestCode() {
    if (_isEmailValid) {
      sl<ForgotPasswordBloc>().add(
        RequestCode(
          email: _emailController.text.trim(),
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
                if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  setState(() => _isEmailValid = false);
                  return false;
                }
                setState(() => _isEmailValid = true);
                return true;
              },
              hintText: t.email_hint,
              prefixIcon: Iconic.envelope,
            ),
            const Gap(24),
            CustomButton(
              text: t.request_code,
              enabled: _isEmailValid,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 18,
                letterSpacing: 0.5,
              ),
              onPressed: () {
                _handleRequestCode();
              },
              icon: Iconic.envelope,
            ),
          ],
        ),
      ),
    );
  }
}
