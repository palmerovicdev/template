import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/widgets/custom_button.dart';
import 'package:template/core/widgets/validation_code_field.dart';
import 'package:template/features/auth/presentation/bloc/otp/otp_bloc.dart';
import 'package:template/i18n/strings.g.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key, required this.email});

  final String email;

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
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

  void _handleVerifyOtp() {
    if (_isCodeValid) {
      sl<OtpBloc>().add(
        VerifyOtp(
          email: widget.email,
          otp: _codeController.text.trim(),
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
              onCompleted: (isValid) => setState(() => _isCodeValid = isValid),
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
                _handleVerifyOtp();
              },
              icon: Iconic.shield_check,
            ),
          ],
        ),
      ),
    );
  }
}
