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
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override String get error_message => 'Ocurrió un error';
	@override String get auth_title => 'Bienvenido a Template';
	@override String get auth_subtitle => 'Inicia sesión con tu email y contraseña';
	@override String get sign_in => 'Iniciar Sesión';
	@override String get auth_success => 'Has iniciado sesión con éxito';
	@override String get email_hint => 'Email';
	@override String get email_required => 'Por favor, ingresa tu email';
	@override String get email_invalid => 'Por favor, ingresa un email válido';
	@override String get password_hint => 'Contraseña';
	@override String get password_required => 'Por favor, ingresa tu contraseña';
	@override String get password_too_short => 'La contraseña debe tener al menos 6 caracteres';
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
	@override String get forgot_password => '¿Olvidaste tu contraseña?';
	@override String get dont_have_an_account => '¿No tienes una cuenta?';
	@override String get sign_up => 'Regístrate';
	@override String get name => 'Nombre';
	@override String get name_hint => 'Nombre';
	@override String get repeat_password_hint => 'Repetir contraseña';
	@override String get already_have_an_account => 'Ya tienes una cuenta?';
	@override String get request_code => 'Solicitar código';
	@override String get invalid_code => 'Código inválido';
	@override String get please_enter_your_email => 'Por favor, ingresa tu email';
	@override String get we_will_send_you_a_code => 'Te enviaremos un código';
	@override String get sign_up_success => 'Te has registrado con éxito';
	@override String get sign_up_success_message => 'Te has registrado con éxito. Por favor, revisa tu email para un código de confirmación.';
	@override String get otp_title => 'Verifica tu email';
	@override String get otp_subtitle => 'Ingresa el código que te enviamos a tu email';
	@override String get verify_otp => 'Verificar OTP';
	@override String get otp_success => 'Has verificado tu email con éxito';
	@override String get otp_success_message => 'Has verificado tu email con éxito. Ahora puedes iniciar sesión.';
	@override String get reset_password_success => 'Has restablecido tu contraseña con éxito';
	@override String get reset_password_success_message => 'Has restablecido tu contraseña con éxito. Ahora puedes iniciar sesión.';
	@override String get reset_password_title => 'Restablecer contraseña';
	@override String get reset_password_subtitle => 'Ingresa tu nueva contraseña';
	@override String get reset_password => 'Restablecer contraseña';
	@override String get new_password_hint => 'Nueva contraseña';
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
			'auth_subtitle' => 'Inicia sesión con tu email y contraseña',
			'sign_in' => 'Iniciar Sesión',
			'auth_success' => 'Has iniciado sesión con éxito',
			'email_hint' => 'Email',
			'email_required' => 'Por favor, ingresa tu email',
			'email_invalid' => 'Por favor, ingresa un email válido',
			'password_hint' => 'Contraseña',
			'password_required' => 'Por favor, ingresa tu contraseña',
			'password_too_short' => 'La contraseña debe tener al menos 6 caracteres',
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
			'forgot_password' => '¿Olvidaste tu contraseña?',
			'dont_have_an_account' => '¿No tienes una cuenta?',
			'sign_up' => 'Regístrate',
			'name' => 'Nombre',
			'name_hint' => 'Nombre',
			'repeat_password_hint' => 'Repetir contraseña',
			'already_have_an_account' => 'Ya tienes una cuenta?',
			'request_code' => 'Solicitar código',
			'invalid_code' => 'Código inválido',
			'please_enter_your_email' => 'Por favor, ingresa tu email',
			'we_will_send_you_a_code' => 'Te enviaremos un código',
			'sign_up_success' => 'Te has registrado con éxito',
			'sign_up_success_message' => 'Te has registrado con éxito. Por favor, revisa tu email para un código de confirmación.',
			'otp_title' => 'Verifica tu email',
			'otp_subtitle' => 'Ingresa el código que te enviamos a tu email',
			'verify_otp' => 'Verificar OTP',
			'otp_success' => 'Has verificado tu email con éxito',
			'otp_success_message' => 'Has verificado tu email con éxito. Ahora puedes iniciar sesión.',
			'reset_password_success' => 'Has restablecido tu contraseña con éxito',
			'reset_password_success_message' => 'Has restablecido tu contraseña con éxito. Ahora puedes iniciar sesión.',
			'reset_password_title' => 'Restablecer contraseña',
			'reset_password_subtitle' => 'Ingresa tu nueva contraseña',
			'reset_password' => 'Restablecer contraseña',
			'new_password_hint' => 'Nueva contraseña',
			_ => null,
		};
	}
}
