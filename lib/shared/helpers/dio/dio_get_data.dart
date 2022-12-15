import 'package:dio/dio.dart';

import 'package:news_app/shared/constants/api_strings.dart';
import 'dio_client_setup.dart';

class DioGetData {
  static Future<Response> requestData({
    required String categoryQuery,
  }) async {
    try {
      return await DioClientSetup.dio!.get(
        ApiStrings.END_POINT,
        queryParameters: {
          'ApiKey': ApiStrings.API_KEY,
          'country': ApiStrings.US_COUNTRY_QUERY,
          'category': categoryQuery,
        },
      );
    } on DioError catch (error) {
      throw Exception('failed to load the Request cause : $error');
    }
  }
}
