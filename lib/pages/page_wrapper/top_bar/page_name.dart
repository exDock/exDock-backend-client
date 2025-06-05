// Flutter imports:
// Project imports:
import 'package:exdock_backend_client/globals/variables.dart';
import 'package:flutter/material.dart';

class PageName extends StatefulWidget {
  const PageName({super.key});

  @override
  State<PageName> createState() => _PageNameState();
}

class _PageNameState extends State<PageName> {
  String capitalise(String input) {
    if (input.isEmpty) return "";
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  @override
  void initState() {
    super.initState();
    pathNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    pathNotifier.removeListener(() {
      setState(() {});
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> breadCrumbsList = pathNotifier.value.split("/");
    if (breadCrumbsList.isNotEmpty) breadCrumbsList.removeAt(0);
    if (breadCrumbsList.isNotEmpty) breadCrumbsList.removeLast();
    String breadCrumbs = breadCrumbsList.join(" > ").replaceAll("-", " ");

    Widget pageNameWidget = Text(
      capitalise(pathNotifier.value.split("/").last).replaceAll("-", " "),
      style: Theme.of(context).textTheme.headlineLarge,
    );
    if (breadCrumbs.isNotEmpty) {
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
