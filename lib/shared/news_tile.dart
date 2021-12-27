import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/presentation/models/news_model.dart';
import 'package:news_app/presentation/views/news_details_view.dart';

class NewsTile extends StatelessWidget {
  final NewsModel? newsModel;
  const NewsTile({Key? key, this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsDetailsView(newsModel: newsModel))),
      child: ListTile(
        title: Text(newsModel!.title!,
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: Text(newsModel!.author!,
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w400, fontSize: 14)),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(newsModel!.urlToImage!),
        ),
      ),
    );
  }
}
