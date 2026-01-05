import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/i18n/strings.g.dart';

class ForgotPasswordTitle extends StatelessWidget {
  const ForgotPasswordTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        return SliverAppBar(
          leading: const SizedBox.shrink(),
          backgroundColor: isDark ? AppColors.dark.bgDark : AppColors.light.bgDark,
          expandedHeight: 140,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(MediaQuery.viewPaddingOf(context).top),
                Icon(
                  Iconic.envelope_solid,
                  size: 28,
                  color: isDark ? AppColors.dark.text : AppColors.light.text,
                ),
                const Gap(16),
                Column(
                  children: [
                    Text(
                      t.please_enter_your_email,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: .bold,
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(8),
                    Text(
                      t.we_will_send_you_a_code,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
