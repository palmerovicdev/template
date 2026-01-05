import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/widgets/custom_button.dart';
import 'package:template/core/widgets/validation_code_field.dart';
import 'package:template/features/auth/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:template/i18n/strings.g.dart';

class ForgotPasswordValidateCode extends StatefulWidget {
  const ForgotPasswordValidateCode({super.key});

  @override
  State<ForgotPasswordValidateCode> createState() => _ForgotPasswordValidateCodeState();
}

class _ForgotPasswordValidateCodeState extends State<ForgotPasswordValidateCode> {
  final _codeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isCodeValid = false;

  @override
  void initState() {
    super.initState();
    _codeController.addListener(() {
      setState(() {
        _isCodeValid = formKey.currentState?.validate() ?? false;
      });
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _handleRequestCode() {
    if (_isCodeValid) {
      sl<ForgotPasswordBloc>().add(
        ValidateCode(
          code: _codeController.text.trim(),
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
            ValidationCodeField(
              controller: _codeController,
              formKey: formKey,
            ),
            const Gap(24),
            CustomButton(
              text: t.request_code,
              enabled: _isCodeValid,
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
