import 'package:flutter/material.dart';

class PageName extends StatelessWidget {
  const PageName({super.key});

  String capitalise(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    List<String> breadCrumbsList = Uri.base.path.split("/");
    breadCrumbsList.removeAt(0);
    breadCrumbsList.removeLast();
    String breadCrumbs = breadCrumbsList.join(" > ").replaceAll("-", " ");

    Widget pageNameWidget = Text(
      capitalise(Uri.base.path.split("/").last).replaceAll("-", " "),
      style: Theme.of(context).textTheme.headlineLarge,
    );
    if (breadCrumbs != "") {
      return Stack(
        children: [
          Text(
            breadCrumbs,
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
