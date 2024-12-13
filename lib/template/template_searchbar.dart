import 'package:flutter/material.dart';

class TemplateSearchBar extends StatefulWidget {
  const TemplateSearchBar({super.key});

  @override
  State<TemplateSearchBar> createState() => _TemplateSearchBarState();
}

class _TemplateSearchBarState extends State<TemplateSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
            controller: controller,
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(Icons.notifications),
            trailing: [
              Tooltip(
                message: 'Show more',
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_downward)),
              )
            ]);
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }),
    );
  }
}
