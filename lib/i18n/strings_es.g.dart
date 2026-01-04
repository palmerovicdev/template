///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';

import 'strings.g.dart';

// Path: <root>
class TranslationsEs with BaseTranslations<AppLocale, Translations> implements Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ?? TranslationMetadata(
          locale: AppLocale.es,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <es>.
  @override final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override dynamic operator [](String key) => $meta.getTranslation(key);

  late final TranslationsEs _root = this; // ignore: unused_field

  @override
  TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

  // Translations
  @override String get error_message => 'Ocurrió un error';

  @override String get auth_title => 'Bienvenido a Template';

  @override String get auth_subtitle => 'Inicia sesión con Google para continuar';

  @override String get sign_in => 'Iniciar sesión';

  @override String get auth_success => 'Has iniciado sesión con éxito';

  @override String get ok => 'OK';

  @override String get no_internet_connection => 'Sin conexión a internet';

  @override String get please_check_your_internet_connection_and_try_again => 'Por favor, verifica tu conexión a internet e intenta de nuevo';

  @override String get invalid_ssl_certificate => 'Certificado SSL inválido';

  @override String get request_cancelled => 'Solicitud cancelada';

  @override String get session_expired => 'Sesión expirada';

  @override String get session_expired_message => 'Tu sesión ha expirado. Por favor, inicia sesión de nuevo.';

  @override String get no_error_present_in_error_state => 'No hay error presente en el estado de error';

  @override String get timeout_error => 'Error de tiempo de espera';

  @override String get operation_cancelled => 'Operación cancelada';

  @override String get bad_certificate => 'Certificado incorrecto';

  @override String get unknown_error => 'Error desconocido';

  @override String get unauthorized => 'No autorizado';

  @override String get forbidden => 'Prohibido';

  @override String get not_found => 'No encontrado';

  @override String get conflict => 'Conflicto';

  @override String get internal_server_error => 'Error interno del servidor';

  @override String get bad_request => 'Solicitud incorrecta';

  @override String get too_many_requests => 'Demasiadas solicitudes';

  @override String get unprocessable_entity => 'Entidad no procesable';

  @override String get parse_error => 'Error de análisis';

  @override String get client_error => 'Error del cliente';

  @override String get welcome_back => 'Bienvenido de nuevo';

  @override String get good_morning => '¡Buenos días!';

  @override String get welcome_message => 'Aquí está lo que está pasando con tus proyectos hoy.';

  @override String get logout => 'Cerrar sesión';

  @override String get logout_confirmation => '¿Estás seguro de que quieres cerrar sesión?';

  @override String get cancel => 'Cancelar';

  @override String get logout_success => 'Sesión cerrada correctamente';

  @override String get logout_success_message => 'Has cerrado sesión correctamente.';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'error_message' => 'Ocurrió un error',
      'auth_title' => 'Bienvenido a Template',
      'auth_subtitle' => 'Inicia sesión con Google para continuar',
      'sign_in' => 'Iniciar sesión',
      'auth_success' => 'Has iniciado sesión con éxito',
      'ok' => 'OK',
      'no_internet_connection' => 'Sin conexión a internet',
      'please_check_your_internet_connection_and_try_again' => 'Por favor, verifica tu conexión a internet e intenta de nuevo',
      'invalid_ssl_certificate' => 'Certificado SSL inválido',
      'request_cancelled' => 'Solicitud cancelada',
      'session_expired' => 'Sesión expirada',
      'session_expired_message' => 'Tu sesión ha expirado. Por favor, inicia sesión de nuevo.',
      'no_error_present_in_error_state' => 'No hay error presente en el estado de error',
      'timeout_error' => 'Error de tiempo de espera',
      'operation_cancelled' => 'Operación cancelada',
      'bad_certificate' => 'Certificado incorrecto',
      'unknown_error' => 'Error desconocido',
      'unauthorized' => 'No autorizado',
      'forbidden' => 'Prohibido',
      'not_found' => 'No encontrado',
      'conflict' => 'Conflicto',
      'internal_server_error' => 'Error interno del servidor',
      'bad_request' => 'Solicitud incorrecta',
      'too_many_requests' => 'Demasiadas solicitudes',
      'unprocessable_entity' => 'Entidad no procesable',
      'parse_error' => 'Error de análisis',
      'client_error' => 'Error del cliente',
      'welcome_back' => 'Bienvenido de nuevo',
      'good_morning' => '¡Buenos días!',
      'welcome_message' => 'Aquí está lo que está pasando con tus proyectos hoy.',
      'logout' => 'Cerrar sesión',
      'logout_confirmation' => '¿Estás seguro de que quieres cerrar sesión?',
      'cancel' => 'Cancelar',
      'logout_success' => 'Sesión cerrada correctamente',
      'logout_success_message' => 'Has cerrado sesión correctamente.',
      _ => null,
    };
  }
}
