import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/core/utils/logger.dart';
import 'package:template/i18n/strings.g.dart';

class AuthToggle extends StatelessWidget {
  const AuthToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Text.rich(
        TextSpan(
          text: t.dont_have_an_account,
          children: [
            TextSpan(
              text: ' ${t.sign_up}',
              style: theme.textTheme.bodyMedium?.copyWith(
                letterSpacing: 0.5,
                fontWeight: .bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  logi('Debug');
                  context.go(Routes.signUp.path);
                },
            ),
          ],
        ),
      ),
    );
  }
}
