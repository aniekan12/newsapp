import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/presentation/models/news_model.dart';
import 'package:news_app/services/api/app_api.dart';

class NewsViewModel extends ChangeNotifier {
  Future getNews() async {
    try {
      Response response = await AppApi.getNews();
      if (response.statusCode == 200) {
        List<NewsModel> newsModel = List<NewsModel>.from(
          response.data["articles"].map(
            (news) => NewsModel.fromJson(news),
          ),
        );
        return newsModel;
      }
    } on DioError catch (e) {
      // showDioErrorSnackBar(
      //     text: ErrorMessage().errorMessage!, dioError: e, function: "getNews");
    }
  }
}
