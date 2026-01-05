import 'package:flutter/material.dart';
import 'package:template/core/theme/app_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.icon,
    required this.text,
    required this.style,
    required this.onPressed,
    required this.enabled,
  });

  final IconData? icon;
  final String text;
  final TextStyle? style;
  final VoidCallback onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppConstants.componentHeight,
      child: ElevatedButton.icon(
        key: UniqueKey(),
        onPressed: enabled ? onPressed : null,
        icon: icon != null ? Icon(icon, size: 20) : const SizedBox(),
        label: Text(text, style: style),
      ),
    );
  }
}
