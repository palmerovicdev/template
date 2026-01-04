import 'package:template/core/theme/domain/entity/app_theme_mode.dart';

abstract class ThemeEvent {}

class LoadTheme extends ThemeEvent {}

class ChangeTheme extends ThemeEvent {
  ChangeTheme(this.themeMode);

  final AppThemeMode themeMode;
}
