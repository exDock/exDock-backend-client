import 'package:exdock_backend_client/globals/variables.dart';
import 'package:flutter/material.dart';

class PageName extends StatefulWidget {
  const PageName({super.key});

  @override
  State<PageName> createState() => _PageNameState();
}

class _PageNameState extends State<PageName> {
  final ValueNotifier<String> _pathNotifier = ValueNotifier<String>(path);

  String capitalise(String input) {
    if (input == "") return "";
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  @override
  void initState() {
    _pathNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _pathNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> breadCrumbsList = _pathNotifier.value.split("/");
    if (breadCrumbsList.isNotEmpty) breadCrumbsList.removeAt(0);
    if (breadCrumbsList.isNotEmpty) breadCrumbsList.removeLast();
    String breadCrumbs = breadCrumbsList.join(" > ").replaceAll("-", " ");

    Widget pageNameWidget = Text(
      capitalise(_pathNotifier.value.split("/").last).replaceAll("-", " "),
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
