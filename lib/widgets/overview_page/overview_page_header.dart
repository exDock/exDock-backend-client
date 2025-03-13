import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/widgets/overview_page/bulk/bulk_action.dart';
import 'package:exdock_backend_client/widgets/overview_page/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter.dart';
import 'package:flutter/material.dart';

class OverviewPageHeader extends StatelessWidget {
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
            // TODO: search bar
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
