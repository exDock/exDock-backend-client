import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/widgets/overview_page/bulk/bulk_action.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter.dart';
import 'package:flutter/material.dart';

class OverviewPageHeader extends StatefulWidget {
  const OverviewPageHeader({
    super.key,
    required this.columns,
    required this.bulkActions,
    required this.filters,
  });

  final List<OverviewPageColumn> columns;
  final List<BulkAction> bulkActions;
  final List<Filter> filters;

  @override
  State<OverviewPageHeader> createState() => _OverviewPageHeaderState();
}

class _OverviewPageHeaderState extends State<OverviewPageHeader> {
  void applyKeywordFilter(String searchResult) {
    // TODO: create or edit the "keyword" filter
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).indicatorColor,
        boxShadow: kBoxShadowList,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SearchAnchor(
              shrinkWrap: true,
              viewBackgroundColor: Theme.of(context).indicatorColor,
              builder: (context, searchController) {
                return SearchBar(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).indicatorColor,
                  ),
                  controller: searchController,
                  onTap: () {
                    searchController.openView();
                  },
                  onChanged: (_) {
                    searchController.openView();
                  },
                  onSubmitted: (searchText) {
                    applyKeywordFilter(searchText);
                  },
                  padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
                  trailing: const [Icon(Icons.search_rounded)],
                );
              },
              suggestionsBuilder: (context, searchController) {
                Function() onSelect(String searchText) {
                  return () {
                    applyKeywordFilter(searchText);
                    searchController.closeView(searchText);
                  };
                }

                ListTile createListTile(String searchText) {
                  return ListTile(
                    title: Text(searchText),
                    onTap: onSelect(searchText),
                  );
                }

                // TODO: get search suggestions
                return [
                  createListTile("search result 1"),
                  createListTile("search result 2"),
                  createListTile("search result 3"),
                  createListTile("search result 4"),
                  createListTile("search result 5"),
                ];
              },
            ),
            Row(
              children: [
                // TODO: bulk actions
                // TODO: filters
                // TODO: add new page button
              ],
            ),
          ],
        ),
      ),
    );
  }
}
