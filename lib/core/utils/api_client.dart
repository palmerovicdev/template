import 'package:dio/dio.dart' as dio_lib show BaseOptions, CancelToken, Dio, FormData, InterceptorsWrapper, ResponseType;
import 'package:template/core/di/service_locator.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/core/utils/logger.dart';

class DioClient {
  static String? _cachedToken;
  static dio_lib.CancelToken? _globalCancelToken;
  static final _publicEndpoints = [Routes.login.path];

  static dio_lib.CancelToken getCancelToken() {
    if (_globalCancelToken == null || _globalCancelToken!.isCancelled) {
      _globalCancelToken = dio_lib.CancelToken();
    }
    return _globalCancelToken!;
  }

  static void cancelRequests() {
    _globalCancelToken?.cancel('Session expired');
    _globalCancelToken = null;
  }

  static void restoreCancelToken() {
    _globalCancelToken = dio_lib.CancelToken();
  }

  static Future<String?> _getToken() async {
    if (_cachedToken != null) {
      return _cachedToken;
    }
    return await sl<StorageModule>().secureStorage.read(key: 'token'); //TODO 1/3/26 palmerodev : must change this
  }


  static bool _requiresToken(String path) {
    return !_publicEndpoints.any((endpoint) => path.contains(endpoint));
  }

  static dio_lib.Dio create({
    String? baseUrl,
    bool addContentType = true,
    Duration timeout = const Duration(seconds: 30),
    bool addLocale = true,
  }) {
    final dio = dio_lib.Dio(
      dio_lib.BaseOptions(
        baseUrl: baseUrl ?? 'http://localhost:3000',
        connectTimeout: timeout,
        receiveTimeout: timeout,
        sendTimeout: timeout,
        contentType: addContentType ? 'application/json' : null,
        responseType: dio_lib.ResponseType.json,
      ),
    );

    dio.interceptors.add(
      dio_lib.InterceptorsWrapper(
        onRequest: (options, handler) async {
          final isFormData = options.data is dio_lib.FormData;

          options.cancelToken = getCancelToken();

          if (addContentType && !isFormData && !options.headers.containsKey('content-type')) {
            options.headers['content-type'] = 'application/json';
          }

          if (isFormData) {
            options.headers.remove('content-type');
          }

          options.headers['Accept'] = 'application/json';

          if (_requiresToken(options.path)) {
            final token = await _getToken();
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }

          logi('API Request: ${options.method} ${options.uri}');
          logi('Headers: ${options.headers}');
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          logi('API Response: ${response.statusCode} ${response.requestOptions.uri}');
          return handler.next(response);
        },
        onError: (error, handler) async {
          logi('API Error: ${error.response?.statusCode} ${error.requestOptions.uri}');

          if (error.response?.statusCode == 401) {
            _cachedToken = null;
          }

          return handler.next(error);
        },
      ),
    );

    return dio;
  }

  static Future<String> getLocale() async {
    return await sl<StorageModule>().secureStorage.read(key: 'locale') ?? 'en';
  }

  static void clearToken() {
    _cachedToken = null;
  }

  static Future<void> updateToken(String token) async {
    await sl<StorageModule>().secureStorage.write(key: 'token', value: token); //TODO 1/3/26 palmerodev : must change this
    _cachedToken = token;
  }
}
