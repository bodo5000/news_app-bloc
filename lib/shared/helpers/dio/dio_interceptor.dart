import 'dio_client_setup.dart';
import 'package:dio/dio.dart';

class DioInterCeptor {
  static void dioInterCeptoptors() {
    DioClientSetup.dio!.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }
}
