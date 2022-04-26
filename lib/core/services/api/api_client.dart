part of api_service;

final apiClientProvider = Provider<ApiClient>(
  (_) => ApiClient(),
);

class ApiClient {
  factory ApiClient() => _instance ??= ApiClient._();

  ApiClient._() {
    _dio = Dio();

    _dio.options = _baseOptions;
    if (!kIsWeb) {
      _dio.httpClientAdapter = DefaultHttpClientAdapter();
    }
    _dio.interceptors.add(_interceptorsWrapper);

    if (kDebugMode) {
      _dio.interceptors.add(_logInterceptor);
    }
  }

  static ApiClient? _instance;

  late Dio _dio;

  static BaseOptions get _baseOptions {
    return BaseOptions(
      baseUrl: BasePathConfig.instance.basePath,
      contentType: 'application/json',
      connectTimeout: _kConnectTimeout.inMilliseconds,
      sendTimeout: _kSendTimeout.inMilliseconds,
      receiveTimeout: _kReceiveTimeout.inMilliseconds,
    );
  }

  static InterceptorsWrapper get _interceptorsWrapper {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers.addAll(
          {"X-Api-Key": ApiKeyConfig.instance.key},
        );
        handler.next(options);
      },
    );
  }

  static LogInterceptor get _logInterceptor {
    return LogInterceptor(
      responseBody: false,
      error: true,
      requestHeader: true,
      responseHeader: false,
      request: false,
      requestBody: true,
    );
  }

  Future<Response<Map<String, dynamic>>> invokeAPI(
    String path, {
    required ApiMethod apiMethod,
    Object? bodyData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    if (queryParameters != null) {
      queryParameters.removeWhere((k, v) => v == null);
    }

    try {
      switch (apiMethod) {
        case ApiMethod.get:
          return _get(
            path,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );

        case ApiMethod.post:
          return _post(
            path,
            data: bodyData,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );

        case ApiMethod.patch:
          return _patch(
            path,
            data: bodyData,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );

        case ApiMethod.delete:
          return _delete(
            path,
            data: bodyData,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          );
      }
    } on SocketException catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: ${apiMethod.name.toUpperCase()} $path',
        e,
        trace,
      );
    } on TlsException catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: ${apiMethod.name.toUpperCase()} $path',
        e,
        trace,
      );
    } on IOException catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: ${apiMethod.name.toUpperCase()} $path',
        e,
        trace,
      );
    } on Exception catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: ${apiMethod.name.toUpperCase()} $path',
        e,
        trace,
      );
    }
  }

  Future<Response<Map<String, dynamic>>> _get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    if ((response.statusCode ?? _unknownStatusCode) >= HttpStatus.badRequest) {
      throw ApiException(
        response.statusCode ?? _unknownStatusCode,
        response.statusMessage,
      );
    }

    if (response.data == null && response.statusCode == HttpStatus.noContent) {
      throw ApiException(
        response.statusCode ?? _unknownStatusCode,
        response.statusMessage,
      );
    }

    return response;
  }

  Future<Response<Map<String, dynamic>>> _post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    if ((response.statusCode ?? _unknownStatusCode) >= HttpStatus.badRequest) {
      throw ApiException(
        response.statusCode ?? _unknownStatusCode,
        response.statusMessage,
      );
    }

    if (response.data == null && response.statusCode == HttpStatus.noContent) {
      throw ApiException(
        response.statusCode ?? _unknownStatusCode,
        response.statusMessage,
      );
    }

    return response;
  }

  Future<Response<Map<String, dynamic>>> _patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    if ((response.statusCode ?? _unknownStatusCode) >= HttpStatus.badRequest) {
      throw ApiException(
        response.statusCode ?? _unknownStatusCode,
        response.statusMessage,
      );
    }

    if (response.data == null && response.statusCode == HttpStatus.noContent) {
      throw ApiException(
        response.statusCode ?? _unknownStatusCode,
        response.statusMessage,
      );
    }

    return response;
  }

  Future<Response<Map<String, dynamic>>> _delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.delete<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    if ((response.statusCode ?? _unknownStatusCode) >= HttpStatus.badRequest) {
      throw ApiException(
        response.statusCode ?? _unknownStatusCode,
        response.statusMessage,
      );
    }

    if (response.data == null && response.statusCode == HttpStatus.noContent) {
      throw ApiException(
        response.statusCode ?? _unknownStatusCode,
        response.statusMessage,
      );
    }

    return response;
  }
}
