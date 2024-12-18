import 'package:flutter/material.dart';

class PageName extends StatelessWidget {
  const PageName({super.key, required this.pageName, this.breadCrumbs});

  final String pageName;
  final String? breadCrumbs;

  @override
  Widget build(BuildContext context) {
    Widget pageNameWidget = Text(
      pageName,
      style: Theme.of(context).textTheme.headlineLarge,
    );
    if (breadCrumbs != null) {
      return Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            breadCrumbs!,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: pageNameWidget,
          ),
        ],
      );
    }
    return pageNameWidget;
  }
}
