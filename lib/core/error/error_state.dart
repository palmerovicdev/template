part of 'error_handler.dart';

sealed class ErrorState<T> {
  const ErrorState({
    this.clientError,
    this.parseError,
    this.httpError,
    this.networkError,
    this.stackTrace,
    this.errorMessage,
    this.responseBody,
    this.statusCode,
    this.statusText,
  });

  final Exception? clientError;
  final Exception? parseError;
  final HttpException? httpError;
  final NetworkException? networkError;
  final StackTrace? stackTrace;
  final String? errorMessage;
  final String? responseBody;
  final int? statusCode;
  final String? statusText;

  R when<R>({
    required R Function(NetworkException e) network,
    required R Function(HttpException e) http,
    required R Function(Exception e) parse,
    required R Function(Exception e) client,
  }) {
    if (networkError != null) return network(networkError!);
    if (httpError != null) return http(httpError!);
    if (parseError != null) return parse(parseError!);
    if (clientError != null) return client(clientError!);
    throw StateError(t.no_error_present_in_error_state);
  }

  String getMessage() {
    return when<String>(
      network: (e) {
        switch (e) {
          case NetworkException.noInternetConnection:
            return t.no_internet_connection;
          case NetworkException.timeOutError:
            return t.timeout_error;
          case NetworkException.cancelled:
            return t.operation_cancelled;
          case NetworkException.badCertificate:
            return t.bad_certificate;
          case NetworkException.unknown:
            return t.unknown_error;
        }
      },
      http: (e) {
        switch (e) {
          case HttpException.unAuthorized:
            return t.unauthorized;
          case HttpException.forbidden:
            return t.forbidden;
          case HttpException.notFound:
            return t.not_found;
          case HttpException.conflict:
            return t.conflict;
          case HttpException.internalServerError:
            return t.internal_server_error;
          case HttpException.badRequest:
            return t.bad_request;
          case HttpException.tooManyRequests:
            return t.too_many_requests;
          case HttpException.unprocessableEntity:
            return t.unprocessable_entity;
          case HttpException.unknown:
            return t.unknown_error;
        }
      },
      parse: (e) => t.parse_error,
      client: (e) => t.client_error,
    );
  }

  String getDetailedInfo() {
    final buffer = StringBuffer()
      ..writeln('Error Type: $runtimeType')
      ..writeln('Message: ${getMessage()}');

    if (errorMessage != null) {
      buffer.writeln('Error Detail: $errorMessage');
    }

    if (statusCode != null) {
      buffer.writeln('Status Code: $statusCode');
    }

    if (statusText != null) {
      buffer.writeln('Status Text: $statusText');
    }

    if (responseBody != null && responseBody!.isNotEmpty) {
      final body = responseBody;
      buffer.writeln('Response Body: $body');
    }

    if (stackTrace != null) {
      buffer
        ..writeln('\nStack Trace:')
        ..writeln(stackTrace.toString());
    }

    return buffer.toString();
  }
}

final class DataClientError<T> extends ErrorState<T> {
  DataClientError(
    Exception error, {
    StackTrace? stackTrace,
    super.errorMessage,
  }) : super(
         clientError: error,
         stackTrace: stackTrace,
       ) {
    logError(
      'DataClientError: client error captured!',
      error: error,
      stackTrace: stackTrace,
      tag: 'ErrorState',
    );
  }
}

final class DataNetworkError<T> extends ErrorState<T> {
  DataNetworkError(
    NetworkException error, {
    StackTrace? stackTrace,
    String? errorMessage,
  }) : super(
         networkError: error,
         stackTrace: stackTrace,
         errorMessage: errorMessage,
       ) {
    logError(
      'DataNetworkError: ${error.name}',
      error: errorMessage ?? error.toString(),
      stackTrace: stackTrace,
      tag: 'ErrorState',
    );
  }
}

final class DataHttpError<T> extends ErrorState<T> {
  DataHttpError(
    HttpException error, {
    int? statusCode,
    String? statusText,
    String? responseBody,
    StackTrace? stackTrace,
    String? errorMessage,
  }) : super(
         httpError: error,
         statusCode: statusCode,
         statusText: statusText,
         responseBody: responseBody,
         stackTrace: stackTrace,
         errorMessage: errorMessage,
       ) {
    logError(
      'DataHttpError: ${error.name} (${statusCode ?? "N/A"})',
      error: 'Status: ${statusText ?? "N/A"}\n${errorMessage ?? ""}\nResponse: ${responseBody?.substring(0, responseBody.length > 100 ? 100 : responseBody.length) ?? "N/A"}',
      stackTrace: stackTrace,
      tag: 'ErrorState',
    );
  }
}

final class DataParseError<T> extends ErrorState<T> {
  DataParseError(
    Exception error, {
    StackTrace? stackTrace,
    String? responseBody,
    super.errorMessage,
  }) : super(
         parseError: error,
         stackTrace: stackTrace,
         responseBody: responseBody,
       ) {
    logError(
      'DataParseError: Unable to parse the data!',
      error: 'Error: ${error.toString()}\nResponse preview: ${responseBody ?? "N/A"}',
      stackTrace: stackTrace,
      tag: 'ErrorState',
    );
  }
}
