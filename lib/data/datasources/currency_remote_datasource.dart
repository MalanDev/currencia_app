import 'package:currencia_app/core/network/dio_client.dart';
import 'package:dio/dio.dart';

class CurrencyRemoteDataSource {
  final Dio dio;

  CurrencyRemoteDataSource({required DioClient dioClient})
      : dio = dioClient.dio;

  Future<Map<String, dynamic>> fetchCurrencyData() async {
    final response = await dio.get('latest');
    return response.data;
  }
}
