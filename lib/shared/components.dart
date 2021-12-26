import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utilities/utilities.dart';

Widget errorTextWidget() {
  return Center(
      child: Text("An error occurred. Swipe to refresh",
          style: GoogleFonts.openSans(fontSize: 12)));
}

Widget spaceAfterBackButton() {
  return const SizedBox(
    height: 20,
  );
}

Widget listViewDivider() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 2),
    child: Divider(
      height: 1,
      color: AppColors.grey,
    ),
  );
}

Widget listViewSeparated({
  required int? itemCount,
  required Function(BuildContext context, int index) itemBuilder,
  ScrollPhysics? physics,
  bool primary = true,
  EdgeInsets? padding,
  bool shrinkWrap = false,
}) {
  return ListView.separated(
    itemBuilder: itemBuilder as Widget Function(BuildContext, int),
    shrinkWrap: shrinkWrap,
    separatorBuilder: (context, index) => listViewDivider(),
    physics: physics ?? BouncingScrollPhysics(),
    primary: primary,
    itemCount: itemCount!,
    padding: padding,
  );
}
