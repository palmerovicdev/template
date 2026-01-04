import 'dart:io' as io;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/error/enums.dart';
import 'package:template/core/utils/api_client.dart';
import 'package:template/core/utils/logger.dart';
import 'package:template/core/utils/snackbar_helper.dart';
import 'package:template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/features/auth/presentation/bloc/auth_event.dart';
import 'package:template/i18n/strings.g.dart';

part 'error_state.dart';

typedef Parser<T> = T Function(dynamic data);

class ErrorHandler {
  static bool _isHandlingUnauthorized = false;

  static Future<bool> _isConnected() async {
    final result = await Connectivity().checkConnectivity();
    if (result.first == ConnectivityResult.none) return false;

    try {
      final lookupResult = await io.InternetAddress.lookup('www.google.com').timeout(const Duration(seconds: 3));
      return lookupResult.isNotEmpty && lookupResult[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  static Future<Either<ErrorState<T>, T>> testCallApi<T>({
    required T response,
  }) {
    return Future.delayed(const Duration(milliseconds: 300), () => right(response));
  }

  static Future<Either<ErrorState<T>, T>> callApi<T>({
    required Future<dio.Response<dynamic>> Function() api,
    required Parser<T> parse,
    int timeoutSeconds = 60,
    bool logErrors = true,
    bool redirectIn401 = true,
  }) async {
    try {
      final startTime = DateTime.now();
      final stackTrace = StackTrace.current;

      if (!await _isConnected()) {
        logWarning(
          'Sin conexión a internet detectada',
          tag: 'ErrorHandler',
        );

        SnackbarHelper.showError(
          title: t.no_internet_connection,
          message: t.please_check_your_internet_connection_and_try_again,
        );
        return left(
          DataNetworkError<T>(
            NetworkException.noInternetConnection,
            stackTrace: stackTrace,
          ),
        );
      }

      final res = await api().timeout(
        Duration(seconds: timeoutSeconds),
        onTimeout: () {
          throw dio.DioException(
            requestOptions: dio.RequestOptions(path: ''),
            type: dio.DioExceptionType.connectionTimeout,
            error: NetworkException.timeOutError,
          );
        },
      );

      if (logErrors) {
        logi(
          'API Request: ${res.requestOptions.method} ${res.requestOptions.uri}',
          tag: 'ErrorHandler',
        );
      }

      final status = res.statusCode ?? 0;
      final duration = DateTime.now().difference(startTime);

      if (logErrors) {
        logi(
          'API Response: $status ${res.statusMessage ?? 'N/A'} (${duration.inMilliseconds}ms)',
          tag: 'ErrorHandler',
        );
      }

      if (status >= 200 && status < 300) {
        try {
          final parsed = parse(res.data);
          if (logErrors) {
            logi(
              'Parse exitoso (${duration.inMilliseconds}ms)',
              tag: 'ErrorHandler',
            );
          }
          return right(parsed);
        } catch (e, s) {
          logError(
            'Error al parsear respuesta',
            error: 'Tipo esperado: $T\nError: $e\nBody: ${res.data}',
            stackTrace: s,
            tag: 'ErrorHandler',
          );
          return left(
            DataParseError<T>(
              Exception('Parse error: ${e.toString()}'),
              stackTrace: s,
              responseBody: res.data?.toString() ?? '',
            ),
          );
        }
      }

      // HTTP Errors
      final httpErr = switch (status) {
        400 => HttpException.badRequest,
        401 => HttpException.unAuthorized,
        403 => HttpException.forbidden,
        404 => HttpException.notFound,
        409 => HttpException.conflict,
        422 => HttpException.unprocessableEntity,
        429 => HttpException.tooManyRequests,
        500 => HttpException.internalServerError,
        502 => HttpException.internalServerError,
        503 => HttpException.internalServerError,
        _ => HttpException.unknown,
      };

      if (httpErr == HttpException.unAuthorized && redirectIn401) {
        await _handleUnauthorized();
      }

      return left(
        DataHttpError<T>(
          httpErr,
          statusCode: status,
          statusText: res.statusMessage,
          responseBody: res.data?.toString() ?? '',
          stackTrace: stackTrace,
        ),
      );
    } on dio.DioException catch (e, s) {
      if (logErrors) {
        logError(
          'DioException capturada',
          error: 'Tipo: ${e.type}\nMensaje: ${e.message}\nDetalle: $e',
          stackTrace: s,
          tag: 'ErrorHandler',
        );
      }

      switch (e.type) {
        case dio.DioExceptionType.connectionTimeout:
        case dio.DioExceptionType.sendTimeout:
        case dio.DioExceptionType.receiveTimeout:
          return left(
            DataNetworkError<T>(
              NetworkException.timeOutError,
              stackTrace: s,
              errorMessage: e.message,
            ),
          );

        case dio.DioExceptionType.badCertificate:
          return left(
            DataNetworkError<T>(
              NetworkException.badCertificate,
              stackTrace: s,
              errorMessage: '${t.invalid_ssl_certificate}: ${e.message}',
            ),
          );

        case dio.DioExceptionType.connectionError:
          if (!await _isConnected()) {
            SnackbarHelper.showError(
              title: t.no_internet_connection,
              message: t.please_check_your_internet_connection_and_try_again,
            );
            return left(
              DataNetworkError<T>(
                NetworkException.noInternetConnection,
                stackTrace: s,
                errorMessage: e.message,
              ),
            );
          }
          return left(
            DataNetworkError<T>(
              NetworkException.unknown,
              stackTrace: s,
              errorMessage: e.message,
            ),
          );

        case dio.DioExceptionType.cancel:
          return left(
            DataNetworkError<T>(
              NetworkException.cancelled,
              stackTrace: s,
              errorMessage: e.message ?? t.request_cancelled,
            ),
          );

        case dio.DioExceptionType.badResponse:
          final status = e.response?.statusCode ?? 0;
          final httpErr = switch (status) {
            400 => HttpException.badRequest,
            401 => HttpException.unAuthorized,
            403 => HttpException.forbidden,
            404 => HttpException.notFound,
            409 => HttpException.conflict,
            422 => HttpException.unprocessableEntity,
            429 => HttpException.tooManyRequests,
            500 => HttpException.internalServerError,
            502 => HttpException.internalServerError,
            503 => HttpException.internalServerError,
            _ => HttpException.unknown,
          };

          if (httpErr == HttpException.unAuthorized && redirectIn401) {
            await _handleUnauthorized();
          }

          return left(
            DataHttpError<T>(
              httpErr,
              statusCode: status,
              statusText: e.response?.statusMessage,
              responseBody: e.response?.data?.toString() ?? '',
              stackTrace: s,
            ),
          );

        case dio.DioExceptionType.unknown:
          if (!await _isConnected()) {
            return left(
              DataNetworkError<T>(
                NetworkException.noInternetConnection,
                stackTrace: s,
                errorMessage: e.message,
              ),
            );
          }
          return left(
            DataNetworkError<T>(
              NetworkException.unknown,
              stackTrace: s,
              errorMessage: e.message,
            ),
          );
      }
    } on io.SocketException catch (e, s) {
      if (logErrors) {
        logError(
          'SocketException - Error de conexión',
          error: 'Mensaje: ${e.message}\nDirección: ${e.address?.address ?? "N/A"}\nPuerto: ${e.port ?? "N/A"}',
          stackTrace: s,
          tag: 'ErrorHandler',
        );
      }
      if (e.message.contains('CERTIFICATE_VERIFY_FAILED')) {
        return left(
          DataNetworkError<T>(
            NetworkException.badCertificate,
            stackTrace: s,
            errorMessage: '${t.invalid_ssl_certificate}: ${e.message}',
          ),
        );
      }
      return left(
        DataNetworkError<T>(
          NetworkException.noInternetConnection,
          stackTrace: s,
          errorMessage: e.message,
        ),
      );
    } catch (e, s) {
      if (logErrors) {
        logError(
          'Excepción de cliente no manejada',
          error: 'Tipo: ${e.runtimeType}\nMensaje: $e',
          stackTrace: s,
          tag: 'ErrorHandler',
        );
      }
      return left(
        DataClientError<T>(
          Exception('Error de cliente: ${e.toString()}'),
          stackTrace: s,
        ),
      );
    }
  }

  static Future<void> _handleUnauthorized() async {
    if (_isHandlingUnauthorized) return;
    _isHandlingUnauthorized = true;

    DioClient.cancelRequests();

    SnackbarHelper.showWarning(title: t.session_expired, message: t.session_expired_message);

    try {
      sl<AuthBloc>().add(SignOutEvent());
    } catch (e) {
      logError('Error al cerrar sesión', error: e, tag: 'ErrorHandler');
    } finally {
      DioClient.restoreCancelToken();
      _isHandlingUnauthorized = false;
    }
  }

  static void resetUnauthorizedFlag() {
    _isHandlingUnauthorized = false;
  }
}
