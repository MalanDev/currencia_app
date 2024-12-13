import 'package:currencia_app/core/constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var data = options.data.toString();
    try {
      if (options.data != null) {
        data = (options.data as FormData).fields.toList().toString();
      }
    } catch (ex) {
      data = options.data.toString();
    }
    debugPrint(
        '=====> API LOG: REQUEST[${options.method}] => PATH: ${options.baseUrl + options.path} :::: DATA: $data');

    //set API Key
    options.queryParameters.addAll({"apikey": AppConstants.API_KEY});

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        '=====> API LOG: RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.baseUrl + response.requestOptions.path} :::: DATA: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        '=====> API LOG: ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
