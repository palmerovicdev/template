import 'package:equatable/equatable.dart';
import 'package:template/core/theme/domain/entity/app_theme_mode.dart';

class ThemeState extends Equatable {
  const ThemeState._({this.themeMode});

  factory ThemeState.initial() => const ThemeState._(themeMode: AppThemeMode.system);
  final AppThemeMode? themeMode;

  ThemeState copyWith({AppThemeMode? themeMode}) {
    return ThemeState._(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [themeMode];
}
