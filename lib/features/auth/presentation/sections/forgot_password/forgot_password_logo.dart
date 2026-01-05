import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/core/theme/app_colors.dart';

class ForgotPasswordLogo extends StatelessWidget {
  const ForgotPasswordLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.dark.bg,
      elevation: 0,
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: AppColors.dark.text),
      expandedHeight: 170,
      collapsedHeight: 52,
      toolbarHeight: 52,
      flexibleSpace: FlexibleSpaceBar(
        title: Icon(
          Icons.numbers,
          size: 40,
          color: AppColors.dark.text,
        ),
        expandedTitleScale: 2,
      ),
    );
  }
}
