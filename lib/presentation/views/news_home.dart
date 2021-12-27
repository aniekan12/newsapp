import 'package:flutter/material.dart';
import 'package:news_app/presentation/models/news_model.dart';
import 'package:news_app/presentation/view_models/view_models.dart';
import 'package:news_app/shared/shared.dart';
import 'package:provider/provider.dart';

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  NewsViewModel? model;
  Future? news;
  List<NewsModel>? newsModel;

  getAllNews() {
    news = Provider.of<NewsViewModel>(context, listen: false).getNews();
  }

  @override
  void initState() {
    getAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: AppRefreshIndicator(
            onRefresh: () => getAllNews(),
            child: AppFutureBuilder(
              future: news!,
              returnOnData: true,
              onRefresh: () => getAllNews(),
              onData: (data) {
                newsModel = data;
                return newsModel!.isNotEmpty
                    ? listViewSeparated(
                        itemCount: newsModel!.length,
                        itemBuilder: (context, index) {
                          return NewsTile(newsModel: newsModel![index]);
                        })
                    : noNews();
              },
            )));
  }

  Widget noNews() {
    return Center(child: Text('No news availaible right now'));
  }
}
