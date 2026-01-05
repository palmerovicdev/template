import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/i18n/strings.g.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
            color: AppColors.dark.bg,
          ),
          child: SafeArea(
            child: Icon(
              Iconic.user,
              size: 80,
              color: AppColors.light.bg,
            ),
          ),
        ),
        const Gap(48),
        Column(
          children: [
            Text(
              t.auth_title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 32,
                fontWeight: .bold,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(8),
            Text(
              t.auth_subtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
