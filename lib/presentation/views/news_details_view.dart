import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/presentation/models/news_model.dart';
import 'package:news_app/shared/app_scaffold.dart';
import 'package:news_app/utilities/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsView extends StatelessWidget {
  final NewsModel? newsModel;
  const NewsDetailsView({Key? key, this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      widgetBesidePageTitle: AppBackButton(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(newsModel!.urlToImage!),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(newsModel!.title!,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600, fontSize: 14)),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(newsModel!.author!,
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontStyle: FontStyle.italic)),
          SizedBox(height: 20),
          Text(newsModel!.description!,
              overflow: TextOverflow.visible,
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400, fontSize: 14)),
        ],
      ),
    );
  }

  _launchURL() async {
    final url = newsModel!.url!;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
