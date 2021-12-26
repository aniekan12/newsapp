import 'package:flutter/material.dart';
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
            child: Column(
              children: [],
            )));
  }
}
