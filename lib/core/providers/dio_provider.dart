import 'package:currencia_app/core/network/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<DioClient>((ref) {
  return DioClient();
});
