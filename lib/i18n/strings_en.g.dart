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

  /// en: 'Sign in with your email and password'
  ///
  /// es: 'Inicia sesión con tu email y contraseña'
  String get auth_subtitle => 'Sign in with your email and password';

  /// en: 'Sign In'
  ///
  /// es: 'Iniciar Sesión'
  String get sign_in => 'Sign In';

  /// en: 'You have successfully signed in'
  ///
  /// es: 'Has iniciado sesión con éxito'
  String get auth_success => 'You have successfully signed in';

  /// en: 'Email'
  ///
  /// es: 'Email'
  String get email_hint => 'Email';

  /// en: 'Please enter your email'
  ///
  /// es: 'Por favor, ingresa tu email'
  String get email_required => 'Please enter your email';

  /// en: 'Please enter a valid email'
  ///
  /// es: 'Por favor, ingresa un email válido'
  String get email_invalid => 'Please enter a valid email';

  /// en: 'Password'
  ///
  /// es: 'Contraseña'
  String get password_hint => 'Password';

  /// en: 'Please enter your password'
  ///
  /// es: 'Por favor, ingresa tu contraseña'
  String get password_required => 'Please enter your password';

  /// en: 'Password must be at least 6 characters'
  ///
  /// es: 'La contraseña debe tener al menos 6 caracteres'
  String get password_too_short => 'Password must be at least 6 characters';

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

  /// en: 'Forgot password?'
  ///
  /// es: '¿Olvidaste tu contraseña?'
  String get forgot_password => 'Forgot password?';

  /// en: 'Don't have an account?'
  ///
  /// es: '¿No tienes una cuenta?'
  String get dont_have_an_account => 'Don\'t have an account?';

  /// en: 'Sign Up'
  ///
  /// es: 'Regístrate'
  String get sign_up => 'Sign Up';

  /// en: 'Name'
  ///
  /// es: 'Nombre'
  String get name => 'Name';

  /// en: 'Name'
  ///
  /// es: 'Nombre'
  String get name_hint => 'Name';

  /// en: 'Repeat password'
  ///
  /// es: 'Repetir contraseña'
  String get repeat_password_hint => 'Repeat password';

  /// en: 'Already have an account?'
  ///
  /// es: 'Ya tienes una cuenta?'
  String get already_have_an_account => 'Already have an account?';

  /// en: 'Request code'
  ///
  /// es: 'Solicitar código'
  String get request_code => 'Request code';

  /// en: 'Invalid code'
  ///
  /// es: 'Código inválido'
  String get invalid_code => 'Invalid code';

  /// en: 'Please enter your email'
  ///
  /// es: 'Por favor, ingresa tu email'
  String get please_enter_your_email => 'Please enter your email';

  /// en: 'We will send you a code'
  ///
  /// es: 'Te enviaremos un código'
  String get we_will_send_you_a_code => 'We will send you a code';
}
