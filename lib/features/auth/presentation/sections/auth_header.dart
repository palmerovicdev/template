import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/theme/bloc/theme_bloc.dart';
import 'package:template/core/theme/bloc/theme_event.dart';
import 'package:template/core/theme/domain/entity/app_theme_mode.dart';
import 'package:template/i18n/strings.g.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == .dark;

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
        const Gap(32),
        IconButton(
          onPressed: () {
            final newMode = isDark ? AppThemeMode.light : AppThemeMode.dark;
            sl<ThemeBloc>().add(ChangeTheme(newMode));
          },
          icon: Icon(
            isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            size: 28,
          ),
          tooltip: isDark ? 'Light Mode' : 'Dark Mode',
        ),
        const Gap(16),
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
