///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef StringsEn = Strings; // ignore: unused_element

class Strings with BaseTranslations<AppLocale, Strings> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Strings.of(context);
  static Strings of(BuildContext context) => InheritedLocaleData.of<AppLocale, Strings>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Strings({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Strings>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.en,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           );

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Strings> $meta;

  late final Strings _root = this; // ignore: unused_field

  Strings $copyWith({TranslationMetadata<AppLocale, Strings>? meta}) => Strings(meta: meta ?? this.$meta);

  // Translations

  /// en: 'An error occurred'
  ///
  /// es: 'Ocurrió un error'
  String get error_message => 'An error occurred';

  /// en: 'Welcome to Template'
  ///
  /// es: 'Bienvenido a Template'
  String get auth_title => 'Welcome to Template';

  /// en: 'Sign in with Google to continue'
  ///
  /// es: 'Inicia sesión con Google para continuar'
  String get auth_subtitle => 'Sign in with Google to continue';

  /// en: 'Sign in'
  ///
  /// es: 'Iniciar sesión'
  String get sign_in => 'Sign in';

  /// en: 'You have successfully signed in'
  ///
  /// es: 'Has iniciado sesión con éxito'
  String get auth_success => 'You have successfully signed in';

  /// en: 'OK'
  ///
  /// es: 'OK'
  String get ok => 'OK';

  /// en: 'No internet connection'
  ///
  /// es: 'Sin conexión a internet'
  String get no_internet_connection => 'No internet connection';

  /// en: 'Please check your internet connection and try again'
  ///
  /// es: 'Por favor, verifica tu conexión a internet e intenta de nuevo'
  String get please_check_your_internet_connection_and_try_again => 'Please check your internet connection and try again';

  /// en: 'Invalid SSL certificate'
  ///
  /// es: 'Certificado SSL inválido'
  String get invalid_ssl_certificate => 'Invalid SSL certificate';

  /// en: 'Request cancelled'
  ///
  /// es: 'Solicitud cancelada'
  String get request_cancelled => 'Request cancelled';

  /// en: 'Session expired'
  ///
  /// es: 'Sesión expirada'
  String get session_expired => 'Session expired';

  /// en: 'Your session has expired. Please log in again.'
  ///
  /// es: 'Tu sesión ha expirado. Por favor, inicia sesión de nuevo.'
  String get session_expired_message => 'Your session has expired. Please log in again.';

  /// en: 'No error present in error state'
  ///
  /// es: 'No hay error presente en el estado de error'
  String get no_error_present_in_error_state => 'No error present in error state';

  /// en: 'Timeout error'
  ///
  /// es: 'Error de tiempo de espera'
  String get timeout_error => 'Timeout error';

  /// en: 'Operation cancelled'
  ///
  /// es: 'Operación cancelada'
  String get operation_cancelled => 'Operation cancelled';

  /// en: 'Bad certificate'
  ///
  /// es: 'Certificado incorrecto'
  String get bad_certificate => 'Bad certificate';

  /// en: 'Unknown error'
  ///
  /// es: 'Error desconocido'
  String get unknown_error => 'Unknown error';

  /// en: 'Unauthorized'
  ///
  /// es: 'No autorizado'
  String get unauthorized => 'Unauthorized';

  /// en: 'Forbidden'
  ///
  /// es: 'Prohibido'
  String get forbidden => 'Forbidden';

  /// en: 'Not found'
  ///
  /// es: 'No encontrado'
  String get not_found => 'Not found';

  /// en: 'Conflict'
  ///
  /// es: 'Conflicto'
  String get conflict => 'Conflict';

  /// en: 'Internal server error'
  ///
  /// es: 'Error interno del servidor'
  String get internal_server_error => 'Internal server error';

  /// en: 'Bad request'
  ///
  /// es: 'Solicitud incorrecta'
  String get bad_request => 'Bad request';

  /// en: 'Too many requests'
  ///
  /// es: 'Demasiadas solicitudes'
  String get too_many_requests => 'Too many requests';

  /// en: 'Unprocessable entity'
  ///
  /// es: 'Entidad no procesable'
  String get unprocessable_entity => 'Unprocessable entity';

  /// en: 'Parse error'
  ///
  /// es: 'Error de análisis'
  String get parse_error => 'Parse error';

  /// en: 'Client error'
  ///
  /// es: 'Error del cliente'
  String get client_error => 'Client error';

  /// en: 'Welcome back'
  ///
  /// es: 'Bienvenido de nuevo'
  String get welcome_back => 'Welcome back';

  /// en: 'Good Morning!'
  ///
  /// es: '¡Buenos días!'
  String get good_morning => 'Good Morning!';

  /// en: 'Here's what's happening with your projects today.'
  ///
  /// es: 'Aquí está lo que está pasando con tus proyectos hoy.'
  String get welcome_message => 'Here\'s what\'s happening with your projects today.';

  /// en: 'Logout'
  ///
  /// es: 'Cerrar sesión'
  String get logout => 'Logout';

  /// en: 'Are you sure you want to logout?'
  ///
  /// es: '¿Estás seguro de que quieres cerrar sesión?'
  String get logout_confirmation => 'Are you sure you want to logout?';

  /// en: 'Cancel'
  ///
  /// es: 'Cancelar'
  String get cancel => 'Cancel';

  /// en: 'Logged out successfully'
  ///
  /// es: 'Sesión cerrada correctamente'
  String get logout_success => 'Logged out successfully';

  /// en: 'You have been logged out successfully.'
  ///
  /// es: 'Has cerrado sesión correctamente.'
  String get logout_success_message => 'You have been logged out successfully.';
}
