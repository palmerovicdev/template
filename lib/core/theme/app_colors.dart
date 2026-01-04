import 'package:flutter/material.dart';

class AppColors {
  static Color primary = const HSLColor.fromAHSL(1, 212, 0.77, 0.78).toColor();
  static Color secondary = const HSLColor.fromAHSL(1, 34, 0.60, 0.63).toColor();

  static Color danger = const HSLColor.fromAHSL(1, 359, 0.25, 0.05).toColor();
  static Color warning = const HSLColor.fromAHSL(1, 52, 0.19, 0.57).toColor();
  static Color success = const HSLColor.fromAHSL(1, 146, 0.17, 0.59).toColor();
  static Color info = const HSLColor.fromAHSL(1, 217, 0.28, 0.65).toColor();

  static AppThemeColors get light => AppLightColors();

  static AppThemeColors get dark => AppDarkColors();
}

abstract class AppThemeColors {
  Color get bgDark;

  Color get bg;

  Color get bgLight;

  Color get text;

  Color get textMuted;

  Color get highlight;

  Color get border;

  Color get borderMuted;
}

class AppDarkColors implements AppThemeColors {
  @override
  Color get bgDark => const HSLColor.fromAHSL(1, 214, 0.25, 0.01).toColor();

  @override
  Color get bg => const HSLColor.fromAHSL(1, 212, 0.16, 0.05).toColor();

  @override
  Color get bgLight => const HSLColor.fromAHSL(1, 212, 0.09, 0.09).toColor();

  @override
  Color get text => const HSLColor.fromAHSL(1, 212, 0.47, 0.95).toColor();

  @override
  Color get textMuted => const HSLColor.fromAHSL(1, 212, 0.07, 0.7).toColor();

  @override
  Color get highlight => const HSLColor.fromAHSL(1, 212, 0.05, 0.39).toColor();

  @override
  Color get border => const HSLColor.fromAHSL(1, 212, 0.06, 0.28).toColor();

  @override
  Color get borderMuted => const HSLColor.fromAHSL(1, 212, 0.09, 0.18).toColor();
}

class AppLightColors implements AppThemeColors {
  @override
  Color get bgDark => const HSLColor.fromAHSL(1, 212, 0.11, 0.91).toColor();

  @override
  Color get bg => const HSLColor.fromAHSL(1, 212, 0.22, 0.95).toColor();

  @override
  Color get bgLight => const HSLColor.fromAHSL(1, 212, 1.0, 0.99).toColor();

  @override
  Color get text => const HSLColor.fromAHSL(1, 213, 0.3, 0.05).toColor();

  @override
  Color get textMuted => const HSLColor.fromAHSL(1, 212, 0.06, 0.28).toColor();

  @override
  Color get highlight => const HSLColor.fromAHSL(1, 212, 1.0, 1.0).toColor();

  @override
  Color get border => const HSLColor.fromAHSL(1, 212, 0.04, 0.51).toColor();

  @override
  Color get borderMuted => const HSLColor.fromAHSL(1, 212, 0.06, 0.62).toColor();
}
