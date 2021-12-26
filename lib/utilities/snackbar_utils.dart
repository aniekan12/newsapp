import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/api/base_dio.dart';

import '../main.dart';

void showSnackBar({required String text, Color? color}) {
  scaffoldKey.currentState!.showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: color ?? Colors.black,
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

showErrorSnackBar({required String text}) {
  showSnackBar(text: text, color: Colors.redAccent);
}

void showDioErrorSnackBar(
    {required String text,
    required DioError dioError,
    required String function,
    Duration duration = const Duration(milliseconds: 2500)}) {
  // Snackbar to show text error message
  // passing error variable to check for socket exception
  // also prints log message in debug mode
  BaseDio.debugDioError(error: dioError);
  String message = dioError.message.contains("SocketException")
      ? "Please check your internet connection"
      : text;
  showSnackBar(
    text: message,
  );
}
