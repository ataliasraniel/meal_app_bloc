import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:meal_app_bloc/shared/core/constants/constants.dart';

class ClientApi {
  final Dio dio;
  ClientApi(this.dio);

  ClientApi setup() {
    setupInterceptors();
    return this;
  }

  Future<T> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      log('Making GET request to ${dio.options.baseUrl}$path with params: $queryParameters');
      final response = await dio.get<T>(path, queryParameters: queryParameters);
      return response.data as T;
    } catch (e) {
      log('GET request error: $e');
      return Future.error('GET request failed: $e');
    }
  }

  //interceptors, baseUrl, etc. can be added here
  void setupInterceptors() {
    log('Setting up Dio Interceptors');
    dio.options.baseUrl = kBaseUrl;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add custom headers or logging here
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Handle responses globally
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Handle errors globally
          return handler.next(e);
        },
      ),
    );
  }
}
