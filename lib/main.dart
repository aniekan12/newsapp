import 'package:flutter/material.dart';
import 'package:news_app/presentation/view_models/view_models.dart';
import 'package:news_app/presentation/views/news_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        home: NewsHome(),
      ),
    );
  }

  final providers = [ChangeNotifierProvider(create: (_) => NewsViewModel())];
}
