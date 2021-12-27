import 'package:flutter/material.dart';

final EdgeInsets bodyPaddingNoBottom = bodyPadding.copyWith(bottom: 0);

final BorderRadius topBorderRadius =
    BorderRadius.vertical(top: Radius.circular(30));

final EdgeInsets bodyPadding =
    EdgeInsets.symmetric(horizontal: 16, vertical: 12);

AppBackButton(BuildContext context) => InkWell(
    onTap: () => Navigator.pop(context),
    child: Icon(Icons.chevron_left_outlined));
