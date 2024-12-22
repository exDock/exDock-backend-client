import 'package:flutter/material.dart';

class PageName extends StatefulWidget {
  const PageName({super.key});

  @override
  State<PageName> createState() => _PageNameState();
}

class _PageNameState extends State<PageName> {
  final ValueNotifier<String> _pathNotifier =
      ValueNotifier<String>(Uri.base.path);

  @override
  void initState() {
    super.initState();
    // Example listener: Simulate path change for testing.
    // Replace this with your actual path change logic.
    Future.delayed(Duration(seconds: 5), () {
      _pathNotifier.value = "/new-path/example-title";
    });
  }

  @override
  void dispose() {
    _pathNotifier.dispose();
    super.dispose();
  }

  String _capitalise(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _pathNotifier,
      builder: (context, path, child) {
        List<String> breadCrumbsList = path.split("/");
        if (breadCrumbsList.isNotEmpty) {
          breadCrumbsList.removeAt(0); // Remove leading empty segment
        }
        if (breadCrumbsList.isNotEmpty) {
          breadCrumbsList.removeLast(); // Remove the page name
        }
        String breadCrumbs = breadCrumbsList.join(" > ").replaceAll("-", " ");

        Widget pageNameWidget = Text(
          _capitalise(path.split("/").last.replaceAll("-", " ")),
          style: Theme.of(context).textTheme.headlineLarge,
        );

        if (breadCrumbs.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                breadCrumbs,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              pageNameWidget,
            ],
          );
        }
        return pageNameWidget;
      },
    );
  }
}
