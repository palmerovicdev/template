import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/theme/domain/entity/app_theme_mode.dart';
import 'package:template/core/theme/domain/repository/theme_repository.dart';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  static const _themeKey = 'app_theme';

  @override
  Future<AppThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString(_themeKey);

    switch (theme) {
      case 'light':
        return AppThemeMode.light;
      case 'dark':
        return AppThemeMode.dark;
      default:
        return AppThemeMode.system;
    }
  }

  @override
  Future<void> setThemeMode(AppThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    var value = 'system';
    if (themeMode == AppThemeMode.light) value = 'light';
    if (themeMode == AppThemeMode.dark) value = 'dark';
    await prefs.setString(_themeKey, value);
  }
}
