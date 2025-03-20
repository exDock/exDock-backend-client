import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/overview_page_content.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter.dart';
import 'package:exdock_backend_client/widgets/overview_page/overview_page_header.dart';
import 'package:flutter/material.dart';
import 'package:exdock_backend_client/widgets/overview_page/bulk/bulk_action.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({
    super.key,
    required this.columns,
    required this.visibleColumns,
    required this.getRows,
    this.bulkActions = const [],
    this.filters = const [],
  });

  final List<OverviewPageColumn> columns;
  final List<OverviewPageColumn> visibleColumns;
  final Future<List<OverviewPageRow>> Function(
    List<Filter> filters,
    List<OverviewPageColumn>? columns,
  ) getRows;
  final List<BulkAction> bulkActions;
  final List<Filter> filters;

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  void initState() {
    super.initState();

    for (OverviewPageColumn column in widget.columns) {
      if (!widget.visibleColumns.contains(column)) {
        widget.visibleColumns.add(column);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OverviewPageHeader(
          columns: widget.columns,
          visibleColumns: widget.visibleColumns,
          bulkActions: widget.bulkActions,
          filters: widget.filters,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: OverviewPageContent(
            visibleColumns: widget.visibleColumns,
            getRows: widget.getRows,
            filters: widget.filters,
          ),
        ),
      ].reversed.toList(),
    );
  }
}
