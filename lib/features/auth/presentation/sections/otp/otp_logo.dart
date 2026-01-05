import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/theme/app_colors.dart';

class OtpLogo extends StatelessWidget {
  const OtpLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.dark.bg,
      expandedHeight: 170,
      toolbarHeight: MediaQuery.viewPaddingOf(context).top,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Icon(
            Iconic.shield_check,
            size: 80,
            color: AppColors.light.bg,
          ),
        ),
      ),
    );
  }
}
