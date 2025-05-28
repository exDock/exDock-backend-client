// Flutter imports:
import 'package:flutter/material.dart';

class ExdockSearchBar extends StatelessWidget {
  const ExdockSearchBar({
    super.key,
    required this.onSubmitted,
    required this.getSearchSuggestions,
  });

  final Function(String searchText) onSubmitted;
  final List<String> Function(String searchText) getSearchSuggestions;

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      shrinkWrap: true,
      viewBackgroundColor: Theme.of(context).cardColor,
      builder: (context, searchController) {
        return SearchBar(
          backgroundColor: WidgetStatePropertyAll(
            Theme.of(context).cardColor,
          ),
          controller: searchController,
          onTap: () {
            searchController.openView();
          },
          onChanged: (_) {
            searchController.openView();
          },
          onSubmitted: (searchText) {
            onSubmitted(searchText);
          },
          padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
          trailing: const [Icon(Icons.search_rounded)],
        );
      },
      suggestionsBuilder: (context, searchController) {
        Function() onSelect(String searchText) {
          return () {
            onSubmitted(searchText);
            searchController.closeView(searchText);
          };
        }

        ListTile createListTile(String searchText) {
          return ListTile(
            title: Text(searchText),
            onTap: onSelect(searchText),
          );
        }

        return getSearchSuggestions(searchController.text).map(
          (searchSuggestion) => createListTile(searchSuggestion),
        );
      },
    );
  }
}
