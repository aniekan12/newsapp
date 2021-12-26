import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utilities/utilities.dart';

import 'shared.dart';

class AppFutureBuilder extends StatefulWidget {
  // to reduce redundancy and for uniformity when using FutureBuilder

  final Future? future;
  final Widget? child;
  final Function? onData; // call when snapshot has data
  final bool? returnOnData;

  /// useErrorWidget set to true would display an error message with
  /// a refresh icon instead of swiping to refresh when used as the child of an
  /// AppRefreshIndicator
  final bool? useErrorWidget;

  // For displaying permission error widget when an admin user
  // doesn't have the permission to perform an action, triggered by 403 code
  final bool? showPermissionError;

  final VoidCallback? onRefresh;

  AppFutureBuilder({
    required this.future,
    this.child,
    this.onData,
    this.returnOnData = false,
    this.useErrorWidget = false,
    this.onRefresh,
    this.showPermissionError = false,
  });

  @override
  _AppFutureBuilderState createState() => _AppFutureBuilderState();
}

class _AppFutureBuilderState extends State<AppFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }

        if (snapshot.hasError) {
          if (kDebugMode) {
            debugPrint("Error in future builder: ${snapshot.error}");
          }

          if (widget.useErrorWidget!) return Center(child: errorWidget());
          return errorTextWidget();
        }

        if (snapshot.hasData) {
          // print(snapshot.data);
          if (widget.returnOnData!)
            return widget.onData?.call(snapshot.data);
          else
            widget.onData?.call(snapshot.data);
        }

        return widget.child!;
        // return widget.child;
      },
    );
  }

  Widget errorWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "An error occurred. Tap to reload",
          style: TextStyle(color: AppColors.grey),
        ),
        IconButton(icon: Icon(Icons.refresh), onPressed: widget.onRefresh?.call)
      ],
    );
  }
}
