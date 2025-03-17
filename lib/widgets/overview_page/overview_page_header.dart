import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/widgets/buttons/exdock_button.dart';
import 'package:exdock_backend_client/widgets/input/exdock_search_bar.dart';
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
            ExdockSearchBar(
              onSubmitted: applyKeywordFilter,
              getSearchSuggestions: (searchText) {
                return [
                  "search result 1",
                  "search result 2",
                  "search result 3",
                  "search result 4",
                  "search result 5",
                ];
              },
            ),
            Row(
              children: [
                // TODO: bulk actions
                ExdockButton(label: "bulk actions", onPressed: () {}),
                // TODO: filters
                ExdockButton(label: "filters", onPressed: () {}),
                // TODO: add new page button
                ExdockButton(label: "add new page", onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
