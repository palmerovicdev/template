import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/theme/app_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.icon,
    this.style,
    this.expand = true,
    this.height,
    required this.text,
    required this.onPressed,
    required this.enabled,
  });

  final IconData? icon;
  final String text;
  final TextStyle? style;
  final VoidCallback onPressed;
  final bool enabled;
  final bool expand;
  final double? height;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final color = enabled ? AppColors.light.text : colorScheme.onPrimary;
    return SizedBox(
      width: expand ? double.infinity : null,
      height: height ?? AppConstants.componentHeight,
      child: ElevatedButton.icon(
        key: UniqueKey(),
        onPressed: enabled ? onPressed : null,
        icon: icon != null ? Icon(icon, size: 20, color: color) : const SizedBox(),
        label: Text(text, style: style?.copyWith(color: color)),
      ),
    );
  }
}
