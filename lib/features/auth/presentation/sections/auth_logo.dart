import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/theme/app_colors.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.dark.bg,
      expandedHeight: 170,
      toolbarHeight: MediaQuery.viewPaddingOf(context).top,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Icon(
            Iconic.user,
            size: 80,
            color: AppColors.light.bg,
          ),
        ),
      ),
    );
  }
}
