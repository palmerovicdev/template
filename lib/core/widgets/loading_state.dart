import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:template/core/theme/app_colors.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Icon(
            Iconic.bold_bold,
            size: 64,
            color: AppColors.light.text,
          ),
          const SizedBox(height: 24),

          Text(
            'Template',
            style: TextStyle(
              fontSize: 32,
              fontWeight: .bold,
              color: AppColors.light.text,
            ),
          ),
          const SizedBox(height: 48),

          SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.light.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
