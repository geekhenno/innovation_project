import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innovation_project/core/network/api_client.dart';
import 'package:innovation_project/core/network/app_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioClientProvider = Provider(
  (ref) => DioClient(
    baseUrl: 'https://api.quran.com/api/v4/',
  ),
);

class DioClient extends ApiClient {
  static const Duration _duration = Duration(seconds: 60);
  final Dio _dio;
  final String baseUrl;
  DioClient({
    required this.baseUrl,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            receiveTimeout: _duration,
            connectTimeout: _duration,
            sendTimeout: _duration,
          ),
        ) {
    _dio.interceptors.add(
      AppInterceptors(),
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: false,
        responseBody: true,
        responseHeader: false,
        error: false,
        compact: true,
        maxWidth: 90,
      ),
    );
  }
  // Delete:----------------------------------------------------------------------
  @override
  Future<dynamic> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio.delete(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  // Get:-----------------------------------------------------------------------
  @override
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio.get(
      uri,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data;
  }

  // Patch:----------------------------------------------------------------------
  @override
  Future<dynamic> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio.patch(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data;
  }

  // Post:----------------------------------------------------------------------
  @override
  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio.post(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data;
  }

  // Put:-----------------------------------------------------------------------
  @override
  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio.put(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data;
  }
}
