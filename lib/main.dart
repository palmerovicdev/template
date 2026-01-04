import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:template/bloc_init.dart';
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/router/go_router.dart';
import 'package:template/core/theme/app_theme.dart';
import 'package:template/core/theme/bloc/theme_bloc.dart';
import 'package:template/core/theme/bloc/theme_state.dart';
import 'package:template/i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await LocaleSettings.useDeviceLocale();

  runApp(TranslationProvider(child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocInit(
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            title: 'Template',
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode: themeState.themeMode == .dark ? .dark : .light,
          );
        },
      ),
    );
  }
}
