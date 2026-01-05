import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class ValidationCodeField extends StatelessWidget {
  const ValidationCodeField({
    super.key,
    required this.controller,
    required this.formKey,
    required this.onCompleted,
  });

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final ValueChanged<bool> onCompleted;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).colorScheme.primary),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Theme.of(context).colorScheme.surface,
      ),
    );

    return Pinput(
      key: formKey,
      closeKeyboardWhenCompleted: true,
      onCompleted: (_) => onCompleted(true),
      controller: controller,
      keyboardType: .number,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      pinputAutovalidateMode: .onSubmit,
      showCursor: true,
    );
  }
}
