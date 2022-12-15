import 'package:dio/dio.dart';

import 'package:news_app/shared/constants/api_strings.dart';
import 'package:news_app/shared/helpers/dio/dio_interceptor.dart';

class DioClientSetup {
  static Dio? dio;

  static void dioSetup() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiStrings.Base_Url,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20 * 1000,
      sendTimeout: 20 * 1000,
    );

    dio = Dio(options);
    DioInterCeptor.dioInterCeptoptors();
  }
}
