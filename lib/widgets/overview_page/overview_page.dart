import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter.dart';
import 'package:exdock_backend_client/widgets/overview_page/overview_page_header.dart';
import 'package:flutter/material.dart';
import 'package:exdock_backend_client/widgets/overview_page/bulk/bulk_action.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({
    super.key,
    required this.columns,
    required this.rows,
    this.bulkActions = const [],
    this.filters = const [],
  });

  final List<OverviewPageColumn> columns;
  final List<OverviewPageRow> rows;
  final List<BulkAction> bulkActions;
  final List<Filter> filters;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OverviewPageHeader(
          columns: columns,
          bulkActions: bulkActions,
          filters: filters,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            color: Colors.deepOrange,
          ),
        ),
      ].reversed.toList(),
    );
  }
}
