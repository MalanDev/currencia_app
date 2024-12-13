import 'package:currencia_app/core/constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'custom_interceptor.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(BaseOptions(
          baseUrl: AppConstants.baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 6), // 6 seconds
          receiveTimeout: const Duration(seconds: 8), // 4 seconds
        ))
          ..interceptors.add(CustomInterceptors());

  Dio get dio => _dio;
}
