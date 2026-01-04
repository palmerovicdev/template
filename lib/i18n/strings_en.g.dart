///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData
          .of<AppLocale, Translations>(context)
          .translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ?? TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

  // Translations

  /// en: 'An error occurred'
  String get error_message => 'An error occurred';

  /// en: 'Welcome to Template'
  String get auth_title => 'Welcome to Template';

  /// en: 'Sign in with Google to continue'
  String get auth_subtitle => 'Sign in with Google to continue';

  /// en: 'Sign in'
  String get sign_in => 'Sign in';

  /// en: 'You have successfully signed in'
  String get auth_success => 'You have successfully signed in';

  /// en: 'OK'
  String get ok => 'OK';

  /// en: 'No internet connection'
  String get no_internet_connection => 'No internet connection';

  /// en: 'Please check your internet connection and try again'
  String get please_check_your_internet_connection_and_try_again => 'Please check your internet connection and try again';

  /// en: 'Invalid SSL certificate'
  String get invalid_ssl_certificate => 'Invalid SSL certificate';

  /// en: 'Request cancelled'
  String get request_cancelled => 'Request cancelled';

  /// en: 'Session expired'
  String get session_expired => 'Session expired';

  /// en: 'Your session has expired. Please log in again.'
  String get session_expired_message => 'Your session has expired. Please log in again.';

  /// en: 'No error present in error state'
  String get no_error_present_in_error_state => 'No error present in error state';

  /// en: 'Timeout error'
  String get timeout_error => 'Timeout error';

  /// en: 'Operation cancelled'
  String get operation_cancelled => 'Operation cancelled';

  /// en: 'Bad certificate'
  String get bad_certificate => 'Bad certificate';

  /// en: 'Unknown error'
  String get unknown_error => 'Unknown error';

  /// en: 'Unauthorized'
  String get unauthorized => 'Unauthorized';

  /// en: 'Forbidden'
  String get forbidden => 'Forbidden';

  /// en: 'Not found'
  String get not_found => 'Not found';

  /// en: 'Conflict'
  String get conflict => 'Conflict';

  /// en: 'Internal server error'
  String get internal_server_error => 'Internal server error';

  /// en: 'Bad request'
  String get bad_request => 'Bad request';

  /// en: 'Too many requests'
  String get too_many_requests => 'Too many requests';

  /// en: 'Unprocessable entity'
  String get unprocessable_entity => 'Unprocessable entity';

  /// en: 'Parse error'
  String get parse_error => 'Parse error';

  /// en: 'Client error'
  String get client_error => 'Client error';

  /// en: 'Welcome back'
  String get welcome_back => 'Welcome back';

  /// en: 'Good Morning!'
  String get good_morning => 'Good Morning!';

  /// en: 'Here's what's happening with your projects today.'
  String get welcome_message => 'Here\'s what\'s happening with your projects today.';

  /// en: 'Logout'
  String get logout => 'Logout';

  /// en: 'Are you sure you want to logout?'
  String get logout_confirmation => 'Are you sure you want to logout?';

  /// en: 'Cancel'
  String get cancel => 'Cancel';

  /// en: 'Logged out successfully'
  String get logout_success => 'Logged out successfully';

  /// en: 'You have been logged out successfully.'
  String get logout_success_message => 'You have been logged out successfully.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'error_message' => 'An error occurred',
      'auth_title' => 'Welcome to Template',
      'auth_subtitle' => 'Sign in with Google to continue',
      'sign_in' => 'Sign in',
      'auth_success' => 'You have successfully signed in',
      'ok' => 'OK',
      'no_internet_connection' => 'No internet connection',
      'please_check_your_internet_connection_and_try_again' => 'Please check your internet connection and try again',
      'invalid_ssl_certificate' => 'Invalid SSL certificate',
      'request_cancelled' => 'Request cancelled',
      'session_expired' => 'Session expired',
      'session_expired_message' => 'Your session has expired. Please log in again.',
      'no_error_present_in_error_state' => 'No error present in error state',
      'timeout_error' => 'Timeout error',
      'operation_cancelled' => 'Operation cancelled',
      'bad_certificate' => 'Bad certificate',
      'unknown_error' => 'Unknown error',
      'unauthorized' => 'Unauthorized',
      'forbidden' => 'Forbidden',
      'not_found' => 'Not found',
      'conflict' => 'Conflict',
      'internal_server_error' => 'Internal server error',
      'bad_request' => 'Bad request',
      'too_many_requests' => 'Too many requests',
      'unprocessable_entity' => 'Unprocessable entity',
      'parse_error' => 'Parse error',
      'client_error' => 'Client error',
      'welcome_back' => 'Welcome back',
      'good_morning' => 'Good Morning!',
      'welcome_message' => 'Here\'s what\'s happening with your projects today.',
      'logout' => 'Logout',
      'logout_confirmation' => 'Are you sure you want to logout?',
      'cancel' => 'Cancel',
      'logout_success' => 'Logged out successfully',
      'logout_success_message' => 'You have been logged out successfully.',
      _ => null,
    };
  }
}
