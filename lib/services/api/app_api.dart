import 'package:dio/dio.dart';
import 'package:news_app/utilities/endpoints.dart';

import 'base_dio.dart';

class AppApi {
  static final Dio _dio = BaseDio.getExistingDio;

  static Future getNews() {
    return _dio.get(getAllNews!);
  }
}
