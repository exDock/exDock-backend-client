// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:exdock_backend_client/widgets/overview_page/visible_columns_selection/visible_columns_selection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/widgets/buttons/exdock_button.dart';
import 'package:exdock_backend_client/widgets/input/exdock_search_bar.dart';
import 'package:exdock_backend_client/widgets/overview_page/bulk/bulk_action.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/types/string_filter.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';

class OverviewPageHeader extends StatefulWidget {
  const OverviewPageHeader({
    super.key,
    required this.columns,
    required this.visibleColumns,
    required this.bulkActions,
    required this.filters,
    this.individualName,
  });

  final List<OverviewPageColumn> columns;
  final List<OverviewPageColumn> visibleColumns;
  final List<BulkAction> bulkActions;
  final FilterNotifier filters;
  final String? individualName;

  @override
  State<OverviewPageHeader> createState() => _OverviewPageHeaderState();
}

class _OverviewPageHeaderState extends State<OverviewPageHeader> {
  void applyKeywordFilter(String searchResult) {
    // TODO: create or edit the "keyword" filter
  }

  @override
  Widget build(BuildContext context) {
    String addNewText = widget.individualName == null
        ? "add new"
        : "add new ${widget.individualName}";
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
                ExdockButton(
                  label: "bulk actions",
                  onPressed: () {},
                  icon: Icons.bolt_rounded,
                ),
                const SizedBox(width: 12),
                // TODO: filters
                ExdockButton(
                  label: "filters",
                  onPressed: () {
                    // TODO: remove this test functionality
                    if (kDebugMode) {
                      print("filter button pressed");
                    }
                    int testNumber = Random().nextInt(100);
                    while (widget.filters.value.keys
                        .contains("filter_key_$testNumber")) {
                      testNumber = Random().nextInt(100);
                    }
                    widget.filters.addFilter(
                      StringFilter(
                        name: "filterName_$testNumber",
                        key: "filter_key_$testNumber",
                        value: "filter value_$testNumber",
                      ),
                    );
                    if (kDebugMode) {
                      print("filters: ${widget.filters.value.toString()}");
                    }
                  },
                  icon: Icons.filter_alt_rounded,
                ),
                const SizedBox(width: 12),
                // TODO: view settings
                ExdockButton(
                  label: "view",
                  onPressed: () {
                    showPopupWindow(context, childFun: (pop) {
                      return VisibleColumnsSelection(
                        key: GlobalKey(),
                        columns: widget.columns,
                        visibleColumns: widget.visibleColumns,
                      );
                    });
                    // TODO: rows per page
                  },
                  icon: Icons.visibility_rounded,
                ),
                const SizedBox(width: 12),
                // TODO: add new page button
                ExdockButton(
                  label: addNewText,
                  onPressed: () {},
                  icon: Icons.add_rounded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
