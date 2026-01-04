import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:template/core/theme/bloc/theme_event.dart';
import 'package:template/core/theme/bloc/theme_state.dart';
import 'package:template/core/theme/domain/repository/theme_repository.dart';

@lazySingleton
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this._repository) : super(ThemeState.initial()) {
    on<LoadTheme>(_onLoadTheme);
    on<ChangeTheme>(_onChangeTheme);
  }

  final ThemeRepository _repository;

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final mode = await _repository.getThemeMode();
    emit(state.copyWith(themeMode: mode));
  }

  Future<void> _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) async {
    await _repository.setThemeMode(event.themeMode);
    emit(state.copyWith(themeMode: event.themeMode));
  }
}
