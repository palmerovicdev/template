import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/theme/app_constants.dart';

class InputFormField extends StatefulWidget {
  const InputFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.isValid,
    this.controller,
    this.keyboardType,
    this.isPassword = false,
  });

  final String hintText;
  final IconData prefixIcon;
  final bool Function(String?) isValid;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isPassword;

  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  bool isError = false;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: AppConstants.remX05,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: AppConstants.componentHeight,
        ),
        child: TextField(
          cursorHeight: AppConstants.remX25,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? obscureText : false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            setState(() {
              isError = !widget.isValid(value);
            });
          },
          decoration: InputDecoration(
            error: isError ? const SizedBox.shrink() : null,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.remX15),
              borderSide: const BorderSide(color: Colors.red),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(obscureText ? Iconic.eye_crossed : Iconic.eye),
                    onPressed: () => setState(() => obscureText = !obscureText),
                  )
                : null,
            hintText: widget.hintText,
            prefixIcon: Icon(widget.prefixIcon, color: isError ? Colors.red : null),
          ),
        ),
      ),
    );
  }
}
