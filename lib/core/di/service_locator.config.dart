// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../env/env.dart' as _i879;
import '../theme/bloc/theme_bloc.dart' as _i279;
import '../theme/data/repository/theme_repository_impl.dart' as _i671;
import '../theme/domain/repository/theme_repository.dart' as _i909;
import 'service_locator.dart' as _i105;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModule = _$StorageModule();
    gh.factory<_i879.Env>(() => _i879.Env());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storageModule.secureStorage,
    );
    gh.lazySingleton<_i961.AuthRepository>(() => _i409.AuthRepositoryImpl());
    gh.lazySingleton<_i909.ThemeRepository>(() => _i671.ThemeRepositoryImpl());
    gh.lazySingleton<_i797.AuthBloc>(
      () => _i797.AuthBloc(gh<_i961.AuthRepository>()),
    );
    gh.lazySingleton<_i279.ThemeBloc>(
      () => _i279.ThemeBloc(gh<_i909.ThemeRepository>()),
    );
    return this;
  }
}

class _$StorageModule extends _i105.StorageModule {}
