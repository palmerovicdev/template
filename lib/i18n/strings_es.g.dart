///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class StringsEs extends Strings with BaseTranslations<AppLocale, Strings> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  StringsEs({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Strings>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.es,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <es>.
  @override
  final TranslationMetadata<AppLocale, Strings> $meta;

  late final StringsEs _root = this; // ignore: unused_field

  @override
  StringsEs $copyWith({TranslationMetadata<AppLocale, Strings>? meta}) => StringsEs(meta: meta ?? this.$meta);

  // Translations
  @override
  String get error_message => 'Ocurrió un error';
  @override
  String get auth_title => 'Bienvenido a Template';
  @override
  String get auth_subtitle => 'Inicia sesión con tu email y contraseña';
  @override
  String get sign_in => 'Iniciar sesión';
  @override
  String get auth_success => 'Has iniciado sesión con éxito';
  @override
  String get email_hint => 'Email';
  @override
  String get email_required => 'Por favor, ingresa tu email';
  @override
  String get email_invalid => 'Por favor, ingresa un email válido';
  @override
  String get password_hint => 'Contraseña';
  @override
  String get password_required => 'Por favor, ingresa tu contraseña';
  @override
  String get password_too_short => 'La contraseña debe tener al menos 6 caracteres';
  @override
  String get ok => 'OK';
  @override
  String get no_internet_connection => 'Sin conexión a internet';
  @override
  String get please_check_your_internet_connection_and_try_again => 'Por favor, verifica tu conexión a internet e intenta de nuevo';
  @override
  String get invalid_ssl_certificate => 'Certificado SSL inválido';
  @override
  String get request_cancelled => 'Solicitud cancelada';
  @override
  String get session_expired => 'Sesión expirada';
  @override
  String get session_expired_message => 'Tu sesión ha expirado. Por favor, inicia sesión de nuevo.';
  @override
  String get no_error_present_in_error_state => 'No hay error presente en el estado de error';
  @override
  String get timeout_error => 'Error de tiempo de espera';
  @override
  String get operation_cancelled => 'Operación cancelada';
  @override
  String get bad_certificate => 'Certificado incorrecto';
  @override
  String get unknown_error => 'Error desconocido';
  @override
  String get unauthorized => 'No autorizado';
  @override
  String get forbidden => 'Prohibido';
  @override
  String get not_found => 'No encontrado';
  @override
  String get conflict => 'Conflicto';
  @override
  String get internal_server_error => 'Error interno del servidor';
  @override
  String get bad_request => 'Solicitud incorrecta';
  @override
  String get too_many_requests => 'Demasiadas solicitudes';
  @override
  String get unprocessable_entity => 'Entidad no procesable';
  @override
  String get parse_error => 'Error de análisis';
  @override
  String get client_error => 'Error del cliente';
  @override
  String get welcome_back => 'Bienvenido de nuevo';
  @override
  String get good_morning => '¡Buenos días!';
  @override
  String get welcome_message => 'Aquí está lo que está pasando con tus proyectos hoy.';
  @override
  String get logout => 'Cerrar sesión';
  @override
  String get logout_confirmation => '¿Estás seguro de que quieres cerrar sesión?';
  @override
  String get cancel => 'Cancelar';
  @override
  String get logout_success => 'Sesión cerrada correctamente';
  @override
  String get logout_success_message => 'Has cerrado sesión correctamente.';
  @override
  String get forgot_password => '¿Olvidaste tu contraseña?';
  @override
  String get dont_have_an_account => '¿No tienes una cuenta?';
  @override
  String get sign_up => 'Regístrate';
}
