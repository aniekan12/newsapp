import 'package:flutter/material.dart';

class AppRefreshIndicator extends StatefulWidget {
  final RefreshCallback onRefresh;
  final Widget child;

  const AppRefreshIndicator({required this.onRefresh, required this.child});

  @override
  _AppRefreshIndicatorState createState() => _AppRefreshIndicatorState();
}

class _AppRefreshIndicatorState extends State<AppRefreshIndicator> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: SingleChildScrollView(
                child: Container(
                    height: constraints.maxHeight, child: widget.child),
                physics: AlwaysScrollableScrollPhysics(),
                // primary: false,
              ));
        },
      ),
    );
  }
}
